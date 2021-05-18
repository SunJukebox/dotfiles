vim.g.nvim_tree_disable_netrw = 0

vim.api.nvim_set_keymap('n', '<leader>x', [[<cmd> lua require 'nvim-tree'.toggle()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>r', [[<cmd> lua require ('nvim-tree').refresh()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>n', [[<cmd> lua require ('nvim-tree').find_file()<CR>]], { noremap = true, silent = true })

vim.g.nvim_tree_icons = {
    default = '',
    symlink= '',
    git= {
        unstaged = "✗",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked= "★",
        deleted = "",
        ignored = "◌"
      },
    folder = {
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
        symlink_open = "",
      },
    lsp= {
        hint = "",
        info = "",
        warning = "",
        error = "",
      }
    }
