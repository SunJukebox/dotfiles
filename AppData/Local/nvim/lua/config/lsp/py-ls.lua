-- Python LSP Config (pyright)

local on_attach = require('config.lsp.on_attach')

require'lspconfig'.pyright.setup{
    on_attach = on_attach
}
