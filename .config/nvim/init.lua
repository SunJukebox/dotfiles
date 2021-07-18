require('plugins')

local cfg = require('config')
local keys = require('keymappings')
local opts = require('options')
local lsp = require('config.lsp')
local utils = require('utils')
local au, map, com, colo, set = utils.unpack {"au", "map", "com", "colo", "set"}

utils.unpack_G {"CfgComplete", "GitStatus", "Format", "LspCapabilites"}

lsp.setup()

local ts = require('nvim-treesitter.configs')
ts.setup(cfg.treesitter)

au(cfg.autocmd)

com(cfg.commands)

map(keys.global)

set(opts)

utils.setup_notify()

colo "tokyonight"
