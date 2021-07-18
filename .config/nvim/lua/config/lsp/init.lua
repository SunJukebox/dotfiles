local utils = require('utils')
local keys = require('keymappings').lsp

local lsp = {
    diagnostics = {
        underline = true,
        virtual_text = {spacing = 5, prefix = ""},
        signs = true,
        update_in_insert = true
    },

    -- lspconfig setup() arguments, as defined at
    -- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
    cfg = {
        bashls = {},
        -- cssls = {},
        -- dockerls = {},
        efm = require('config.lsp.efm'),
        -- gopls = {},
        -- html = {},
        -- jsonls = {},
        -- pylsp = {},
        pyright = {},
        -- r_language_server = {},
        -- solargraph = nil,
        sumneko_lua = require('config.lsp.lua-ls'),
        -- terraformls = require "config.tf",
        -- tsserver = require "config.noformat",
        -- vimls = {},
        -- vuels = {},
        -- yamlls = {},
        texlab = require('config.lsp.latex-ls')
    }
}

local function set_keys()
    local ns = {noremap = true, silent = true}
    for c1, kx in pairs(keys) do
        for c2, key in pairs(kx) do
            local cmd = ("<Cmd>lua vim.lsp.%s.%s()<CR>"):format(c1, c2)
            vim.api.nvim_buf_set_keymap(0, "n", key, cmd, ns)
        end
    end
end

local function set_highlight()
    utils.au {
        Highlight = {
            "CursorHold <buffer> lua vim.lsp.buf.document_highlight()",
            "CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()",
            "CursorMoved <buffer> lua vim.lsp.buf.clear_references()"
        }
    }
end

function lsp.on_attach(client, bufnr)
    local _ = bufnr
    local rc = client.resolved_capabilities

    set_keys()
    if rc.document_highlight then set_highlight() end

    require("lsp_signature").on_attach(require("config.lsp_signature"))

    -- FIXME: this gets added over and over. Also adds it when not supported.
    -- vim.cmd "au LSP BufEnter,CursorHold,InsertLeave <buffer> lua vim.lsp.codelens.refresh()"
end

function lsp.setup()
    vim.cmd "aug LSP | au!"
    local nvim_lsp = require('lspconfig')
    local cfg_default = {
        on_attach = lsp.on_attach,
        flags = {debounce_text_changes = 150}
    }
    for k, cfg in pairs(lsp.cfg) do
        nvim_lsp[k].setup(vim.tbl_extend("keep", cfg, cfg_default))
    end
    vim.cmd "aug END"

    local opd = vim.lsp.diagnostic.on_publish_diagnostics
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(opd,
                                                                       lsp.diagnostics)

    utils.au {
        Format = {
            -- "BufWritePre *.go lua OrgImports()",
            -- "BufWritePre *.js lua OrgJSImports()",
            "BufWritePre * lua Format()"
        }
    }
end

return lsp
