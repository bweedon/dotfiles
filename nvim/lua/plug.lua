return require('packer').startup(function(use)
	-- packer self management
	use 'wbthomason/packer.nvim'
	-- nvim lsp implementation
	use 'neovim/nvim-lspconfig'
	-- autocomplete codicons
	use 'onsails/lspkind-nvim'
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
	use 'kyazdani42/nvim-web-devicons'
	use 'windwp/nvim-autopairs'
	use {'hoob3rt/lualine.nvim'}
	use {'akinsho/nvim-bufferline.lua'}
	use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}}
	use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
    use 'sainnhe/sonokai'
    use 'lervag/vimtex'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'f3fora/cmp-spell'
    use 'hrsh7th/nvim-cmp'
    use 'preservim/nerdtree'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'
    use 'numToStr/Comment.nvim'
	vim.cmd([[
	augroup packer_user_config
	autocmd!
	autocmd BufWritePost plug.lua source <afile> | PackerCompile
	augroup end
	]])
end)

