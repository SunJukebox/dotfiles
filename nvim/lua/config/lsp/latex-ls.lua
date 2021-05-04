-- Latex LSP Config (texlab)

local on_attach = require('config.lsp.on_attach')
require'lspconfig'.texlab.setup{
	settings = {
        bibtex = {
            formatting = {
                lineLength = 90
            }
        },
		latex = {
			build = {
				args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f", "-pvc" },
				executable = "latexmk",
				onSave = true
			},
			forwardSearch = {
				executable = "okular",
				args = {"--unique", "file:%p#src:%l%f"}
			},
			lint = {
				onSave = true
			}
		}
	},
    on_attach = on_attach
}

-- Auto-format *.rs (rust) files prior to saving them
-- vim.cmd("autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 1000)")
