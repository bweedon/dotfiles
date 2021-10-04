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
	vim.cmd([[
	augroup packer_user_config
	autocmd!
	autocmd BufWritePost plug.lua source <afile> | PackerCompile
	augroup end
	]])
end)

