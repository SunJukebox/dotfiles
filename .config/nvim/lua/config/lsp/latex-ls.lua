-- Latex LSP Config (texlab)
return {
	settings = {
		texlab = {
			build = {
                executable = "latexmk",
                args = {"-pdf", "-interaction=nonstopmode", "-synctex=1", "%f", "-pvc"},
                onSave = true,
				isContinuous = true
			},
			forwardSearch = {
				executable = "zathura",
				args = {"--synctex-forward", "%l:1:%f", "%p"}
			},
			chktex = {
				onOpenAndSave = true
			},
            formatterLineLength = 80
		}
	},
}

-- Auto-format *.rs (rust) files prior to saving them
-- vim.cmd("autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 1000)")
