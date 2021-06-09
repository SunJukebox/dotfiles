local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  	execute 'packadd packer.nvim'
end

-- Auto-compile when there is a change in plugins.lua
vim.cmd "autocmd BufWritePost plugins.lua PackerCompile"

return require('packer').startup(function(use)
	-- Packer can manage itself
  	use 'wbthomason/packer.nvim'

  	-- LSP
  	use {"neovim/nvim-lspconfig", config = [[require('config.lsp')]]}
    use {"kabouzeid/nvim-lspinstall"}

  	-- Snippets
  	use {'SirVer/ultisnips', config = [[require('config.ultisnips')]]}
    -- use {'hrsh7th/vim-vsnip'}
	-- use {'rafamadriz/friendly-snippets', requires = 'hrsh7th/vim-vsnip'}

    -- Auto-complete
  	use {'hrsh7th/nvim-compe', config = [[require('config.compe')]]}

  	-- Colorscheme
  	use {'folke/tokyonight.nvim', config=[[require('config.colorschemes.tokyonight')]]}

  	-- Treesitter (syntx highlighting)
  	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
        config = [[require('config.treesitter')]]
    	}

  	-- Telescope (fuzzy file finder)
  	use {
  	    'nvim-telescope/telescope.nvim',
  	    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        config = [[require('config.telescope')]]
  	}

	-- Formatting
	-- use {'mhartington/formatter.nvim', config = [[require('config.format')]]}

    -- NvimTree
    use {'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'},
       config = [[require('config.nvim-tree')]]
    }

    -- Vimtex (for math() context in UltiSnips)
    use {'lervag/vimtex'}
end)
