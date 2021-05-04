require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        'c', 'latex', 'lua', 'python'
    },
    highlight = {enable = true, use_languagetree = true},
    indent = {enable = false},
    incremental_selection = {enable = true},
    refactor = {
        smart_rename = {enable = true, keymaps = {smart_rename = "grr"}},
        highlight_definitions = { enable = true }
    },
}
