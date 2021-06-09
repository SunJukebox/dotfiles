-- Some keymappings for telescope
vim.api.nvim_set_keymap('n', '<C-f>', [[<cmd>lua require('telescope.builtin').find_files()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-b>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-g>', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true, silent = true })
