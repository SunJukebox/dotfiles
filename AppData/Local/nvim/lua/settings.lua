-- Settings file

vim.cmd("filetype plugin indent on")

-- Function to set options in scopes.
local function opt(o, v, scopes)
	scopes = scopes or vim.o
	for _, s in ipairs(scopes) do s[o] = v end
end

-- Define common scopes
local buffer = {vim.o, vim.bo}
local window = {vim.o, vim.wo}

-- File Browsing with netrw
--[[
vim.g.netrw_banner=0
vim.g.netrw_browse_split=4
vim.g.netrw_altv=1
vim.g.netrw_liststyle=3
vim.g.netrw_list_hide = netrw_gitignore#Hide().'.*\.swp$'
vim.cmd("let g:netrw_list_hide = \(^\|\s\s\)\zs\.\S\+")
]]
-- TeX Flavor
vim.g.tex_flavor = 'latex'

-- Colorscheme
vim.o.termguicolors = true
vim.o.background = 'dark'
vim.cmd("colorscheme tokyonight")

-- Word wrapping
opt('textwidth', 90, buffer) -- Max width of line before wrapping
vim.o.whichwrap = vim.o.whichwrap..'<,>,[,],h,l' -- move to next line with theses keys

-- Completion
vim.o.wildmode = 'longest,full'
vim.o.shortmess = vim.o.shortmess..'c'
vim.o.completeopt = 'menuone,noselect'

-- Search and substitute
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.inccommand = 'nosplit'

-- Tab
opt('tabstop', 4, buffer)
opt('softtabstop', 0, buffer)
opt('shiftwidth', 4, buffer)
opt('expandtab', true, buffer)
opt('smartindent', true, buffer)

-- Line numbering
opt('number', true, window)
opt('relativenumber', true, window)

-- Font
vim.o.guifont = "FiraCode NF:h14"

-- Miscellaneous
vim.o.scrolloff = 0
vim.o.showmatch = true
vim.o.lazyredraw = true
vim.o.laststatus = 2
vim.o.showmode = false
vim.o.hidden = true
vim.o.joinspaces = false
vim.o.guicursor = [[n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50]]
vim.o.updatetime = 500
opt('conceallevel', 2, window)
opt('concealcursor', 'nc', window)
vim.o.previewheight = 5
opt('undofile', false, buffer)
opt('synmaxcol', 500, buffer)
vim.o.display = 'msgsep'
opt('cursorline', true, window)
opt('modeline', false, buffer)
vim.o.mouse = "nvih"
opt('signcolumn', 'yes:1', window)
vim.cmd('set iskeyword+=-') -- treat dash separated words as a word text object"
vim.o.title = true
TERMINAL = vim.fn.expand('$TERMINAL')
vim.cmd('let &titleold="'..TERMINAL..'"')
vim.o.titlestring="%<%F%=%l/%L - nvim"
vim.cmd('syntax on') -- syntax highlighting
vim.o.pumheight = 10 -- Makes popup menu smaller
vim.o.fileencoding = "utf-8" -- The encoding written to file
vim.o.cmdheight = 2 -- More space for displaying messages
vim.cmd('set colorcolumn=99999') -- fix indentline for now
vim.o.splitbelow = true -- Horizontal splits will automatically be below
vim.o.splitright = true -- Vertical splits will automatically be to the right
vim.o.t_Co = "256" -- Support 256 colors
vim.o.showtabline = 2 -- Always show tabs
vim.o.backup = false -- This is recommended by coc
vim.o.writebackup = false -- This is recommended by coc
vim.o.timeoutlen = 100 -- By default timeoutlen is 1000 ms
vim.o.clipboard = "unnamedplus" -- Have keyboard use system clipboard (xclip)
