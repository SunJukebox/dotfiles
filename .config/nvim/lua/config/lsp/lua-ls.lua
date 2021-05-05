-- Lua LSP Config (sumneko_lua)

local on_attach = require('config.lsp.on_attach')

local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

local sumneko_root_path
local sumneko_binary

if system_name == "Windows" then
    sumneko_root_path = vim.fn.stdpath('data')..'/lang-servers/lua-language-server'
    sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server.exe"
else
    sumneko_root_path = vim.fn.stdpath('data').."/lspinstall/lua"
    sumneko_binary = sumneko_root_path.."/sumneko-lua-language-server"
end

require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';')
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
			    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
	        	[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true},
                maxPreload = 10000
            },
	    	-- Do not send telemetry data contained randomized but unique identifier
	    	telemetry = {
				enable = false,
	    	},
		},
    },
    on_attach = on_attach
}
