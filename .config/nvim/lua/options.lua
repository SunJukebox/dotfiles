local d = "defaults"

vim.cmd("filetype plugin indent on")
vim.cmd('syntax on') -- syntax highlighting

return {
    background = "dark",
    backup = false, -- This is recommended by coc
    clipboard = "unnamedplus",
    colorcolumn = "99999", -- fix indentline for now
    complete = {d, "kspell"},
    completeopt = {"menuone", "noselect", "noinsert"},
    concealcursor = 'nc',
    conceallevel = 2,
    cmdheight = 2, -- More space for displaying messages
    display = 'msgsep',
    diffopt = {d, "algorithm:patience", "indent-heuristic", "vertical"},
    expandtab = true,
    fileencoding = "utf-8", -- The encoding written to file
    grepprg = d,
    guifont = "FiraCode Nerd Font:h14",
    guicursor = [[n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50]],
    hidden = true,
    icon = true,
    iconstring = "nvim",
    ignorecase = true,
    inccommand = "nosplit",
    iskeyword = "+-",
    joinspaces = false,
    laststatus = 2,
    lazyredraw = true,
    cursorline = true,
    modeline = false,
    mouse = "nvih",
    mousemodel = "extend",
    number = true,
    relativenumber = true,
    omnifunc = "v:lua.vim.lsp.omnifunc",
    path = "**",
    previewheight = 5,
    pumheight = 10, -- Makes popup menu smaller
    scrolloff = 0,
    shell = "zsh",
    shiftwidth = 4,
    shortmess = "+c",
    showcmd = true,
    showmatch = true,
    showmode = false,
    showtabline = 2, -- Always show tabs
    signcolumn = 'yes:1',
    smartcase = true,
    smartindent = true,
    softtabstop = 0,
    splitbelow = true,
    splitright = true,
    startofline = false,
    synmaxcol = 500,
    tabstop = 4,
    termguicolors = true,
    textwidth = 90,
    timeoutlen = 100, -- By default timeoutlen is 1000 ms
    title = true,
    titlestring = " %{get(w:,'git_status','~git')} %=  %<%f%=%M  %{nvim_treesitter#statusline(150)}",
    undofile = false,
    updatetime = 2000,
    virtualedit = {"block", "onemore"},
    whichwrap = '+,<,>,[,]',
    wildcharm = 26, -- <C-Z>
    wildignore = {"*/.git/*", "*/node_modules/*"},
    wildmode = {"longest", "full"},
    wrap = true,
    writebackup = false -- This is recommended by coc
    -- t_Co = "256", -- Support 256 colors
}

--[[

-- File Browsing with netrw

vim.g.netrw_banner=0
vim.g.netrw_browse_split=4
vim.g.netrw_altv=1
vim.g.netrw_liststyle=3
-- vim.g.netrw_list_hide = netrw_gitignore#Hide().'.*\.swp$'
-- vim.cmd("let g:netrw_list_hide = \(^\|\s\s\)\zs\.\S\+")

-- TeX Flavor
vim.g.tex_flavor = 'latex'

--[[
TERMINAL = vim.fn.expand('$TERMINAL')
vim.cmd('let &titleold="'..TERMINAL..'"')
]]
