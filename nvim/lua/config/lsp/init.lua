-- Config for built-in LSP

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
--[[
local servers = { "pyright" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
--]]

-- Custom server configs

require('config.lsp.latex-ls')
require('config.lsp.lua-ls')
require('config.lsp.py-ls')

-- Auto-format *.py (python) files prior to saving them
-- vim.cmd("autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 1000)")
