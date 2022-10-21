-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
---																							.
---																						--	├── General Plugins	
	use 'wbthomason/packer.nvim'  														--	│	├── Package Manager
	use 'nvim-lua/plenary.nvim'  														--	│	├──
	use 'neovim/nvim-lspconfig'  														--	│	├──
	use 'williamboman/mason.nvim'  														--	│	├── Cool lsp download ui
	use 'glepnir/lspsaga.nvim'  														--	│	├──	
	use {'romgrk/barbar.nvim', requires = {'kyazdani42/nvim-web-devicons'}}  			--	│	├──	Tabs for files
	use { 'nvim-treesitter/nvim-treesitter-textobjects', after = { 'nvim-treesitter' }} --	│	├── Additional textobjects for treesitter
	use 'tpope/vim-fugitive'															--	│	├── Support for :Git commands
---																							│	└──	High Config	
	use {'nvim-tree/nvim-tree.lua', requires = {'nvim-tree/nvim-web-devicons'}}  		--	│			├──	File tree
	use 'nvim-treesitter/nvim-treesitter'                                              	--	│ 			└── Highlight, edit, and navigate code
---																							├── Visual 
---	 																						│	├──Theme
	use {'folke/tokyonight.nvim', as = 'tokyo'}											--	│	│	├──	Tokyo night theme
	use 'mjlbach/onedark.nvim' 															--	│	│	├──	Theme inspired by Atom
	use 'shaunsingh/nord.nvim' 															--	│	│	├──	Cool nordic theme
	use 'projekt0n/github-nvim-theme' 													--	│	│	└── Github themes
---		 																				--	│	├──Informational
	use {'nvim-lualine/lualine.nvim', 													--	│	│	│
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }} 						--	│	│	└── Cool status line bar
	use { 'goolord/alpha-nvim', requires = { 'kyazdani42/nvim-web-devicons' }}			--	│	startup screen
	-- Fuzzy Finder (files, lsp, etc)
	use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', 
		requires = { 'nvim-lua/plenary.nvim' } }

	-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
	use { 'nvim-telescope/telescope-fzf-native.nvim', 
		run = 'make', cond = vim.fn.executable "make" == 1 }-- Dart/Flutter Plugins

	--- Syntax highlight for Dart
	use 'dart-lang/dart-vim-plugin'

	--- Flutter Tools
	use {'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim'}

	--- Vim language servers
  	use 'natebosch/vim-lsc'
  	use 'natebosch/vim-lsc-dart'
end)

--- Non-beefy plugins 
local saga = require('lspsaga')
saga.init_lsp_saga()
require'bufferline'.setup()
require("flutter-tools").setup{} -- use defaults
require("mason").setup()
require('lualine').setup()
