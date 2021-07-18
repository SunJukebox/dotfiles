--[[local M = {}
local cmd = vim.cmd

function M.create_augroup(autocmds, name)
    cmd('augroup ' .. name)
    cmd('autocmd!')
    for _, autocmd in ipairs(autocmds) do
        cmd('autocmd ' .. table.concat(autocmd, ' '))
    end
    cmd('augroup END')
end

return M]]

local function each(cmd)
    return function(...)
        local args = vim.tbl_flatten({...})
        for _, v in ipairs(args) do vim.cmd(cmd .. " " .. v) end
    end
end

local utils = {
    com = each "com!",
    colo = each "colo",
}

local icons = {
    [vim.log.levels.INFO] = "information",
    [vim.log.levels.WARN] = "warning",
    [vim.log.levels.ERROR] = "error",
    [vim.log.levels.DEBUG] = "applications-debugging",
    [vim.log.levels.TRACE] = "zoom-in",
}

local wait_default = 2000

function utils.Format(wait_ms)
    wait_ms = wait_ms or wait_default
    vim.lsp.buf.formatting_sync(nil, wait_ms)
end

function utils.SmartTabComplete()
    local s = vim.fn.getline("."):sub(1, vim.fn.col(".") - 1):gsub("%s+", "")
    local t = function(str)
      return vim.api.nvim_replace_termcodes(str, true, true, true)
    end

    if s == "" then return t "<Tab>" end
    if s:sub(s:len(), s:len()) == "/" then return t "<C-x><C-f>" end

    return t "<C-x><C-o>"
end

local cfg_files = ( function()
    local pat = "lua/**/*.lua"
    local c = vim.fn.stdpath("config")
    local x = function(v)
      return string.sub(v, #c + 2)
    end

    return vim.tbl_flatten {"init.lua", vim.tbl_map(x, vim.fn.glob(c .. "/" .. pat, 0, 1))}
  end)()

function utils.CfgComplete(argLead)
    local fn = function(v)
        return argLead == "" or v:find(argLead)
    end

    return vim.tbl_filter(fn, cfg_files)
end

function utils.GitStatus()
  local branch = vim.trim(vim.fn.system("git rev-parse --abbrev-ref HEAD 2> /dev/null"))
  if branch == "" then return end
  local dirty = vim.fn.system("git diff --quiet || echo -n \\*")
                    .. vim.fn.system("git diff --cached --quiet || echo -n \\+")
  vim.w.git_status = branch .. dirty
end

function utils.LspCapabilities()
  local cap = {}
  for _, c in pairs(vim.lsp.buf_get_clients()) do cap[c.name] = c.resolved_capabilities end
  print(vim.inspect(cap))
end

function utils.unpack(...)
    local arg = vim.tbl_flatten {...}
    local what = {}
    for _, v in ipairs(arg) do table.insert(what, utils[v]) end
    return unpack(what)
end

function utils.unpack_G(...)
    local arg = vim.tbl_flatten {...}
    for _, v in ipairs(arg) do _G[v] = utils[v] end
end

function utils.setup_notify()
    local orig_notify = vim.notify

    vim.notify = function(msg, log_level)
        log_level = log_level or vim.log.levels.INFO
        local icon = icons[log_level]

        orig_notify(msg, log_level)

        vim.fn.jobstart {"notify-send", "-i", "dialog-" .. icon, msg}
    end
end

function utils.au(...)
  for name, au in pairs(...) do
    vim.cmd(("aug %s | au!"):format(name))
    each("au")(au)
    vim.cmd "aug END"
  end
end

function utils.set(...)
    for k, v in pairs(...) do
        if type(v) == "string" and vim.startswith(v, "+") then
            v = v:sub(2)
            vim.opt[k]:append(v)
        elseif type(v) == "table" and v[1] == "defaults" then
            vim.opt[k]:append(vim.list_slice(v, 2))
        else
            vim.opt[k] = v
        end
    end
end

function utils.map(mappings)
    for mode, mx in pairs(mappings) do
        for _, m in ipairs(mx) do
            local lhs, rhs, opts = unpack(m)
            opts = opts or {}
            opts.noremap = true
            vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
        end
    end
end

return utils
