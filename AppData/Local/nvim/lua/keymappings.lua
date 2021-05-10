vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

-- No highlighting
vim.api.nvim_set_keymap('n', '<Leader>h', ':set hlsearch!<CR>', {noremap = true, silent = true})

-- Quick save
vim.api.nvim_set_keymap('n', '<C-Z>', ':update<CR>', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('v', '<C-Z>', ':update<CR>', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('i', '<C-Z>', ':update<CR>', {noremap = true, silent = true})

-- Better window movement
vim.api.nvim_set_keymap('n', '<A-h>', '<C-w>h', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-j>', '<C-w>j', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-k>', '<C-w>k', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-l>', '<C-w>l', {noremap = true, silent = true})

-- File explorer
-- vim.api.nvim_set_keymap('n', '<Leader>x', ':Lexplore<CR>', {noremap = true, silent = true})

-- Better indenting
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})

-- Switch buffer with <TAB>
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevioius<CR>', {noremap = true, silent = true})

-- Move selected line or block of text in visual mode
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})
