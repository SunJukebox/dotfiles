--[[
local function latexindent()
	return {exe = 'latexindent', args = {'-s'}, stdin = true}
end

require('formatter').setup({
	logging = false,
	filetype = {
		tex = {latexindent}
	}
})

vim.api.nvim_set_keymap('n', '<Leader>f', '<cmd>:Format<CR>', {noremap = true, silent = true})
--]]
