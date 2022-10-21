-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

local plugins = {
	'wbthomason/packer.nvim',														-- Package Manager
	'nvim-lua/plenary.nvim',  														-- Dependency?	
	'neovim/nvim-lspconfig',  														--	
	'williamboman/mason.nvim', 														-- Cool lsp download gui
	'glepnir/lspsaga.nvim',															--	
	{ 'nvim-treesitter/nvim-treesitter-textobjects', after = { 'nvim-treesitter' }},-- Additional textobjects for treesitter
	'tpope/vim-fugitive',															-- Support for :Git commands
	{'nvim-tree/nvim-tree.lua', requires = {'nvim-tree/nvim-web-devicons'}},  		-- File tree
	'nvim-treesitter/nvim-treesitter',                                              -- Highlight, edit, and navigate code
	'folke/tokyonight.nvim',														-- Tokyo night theme
	'mjlbach/onedark.nvim', 														-- Theme inspired by Atom
	'shaunsingh/nord.nvim', 														-- Cool nordic theme
	'projekt0n/github-nvim-theme', 													-- Github themes
	{'nvim-lualine/lualine.nvim', 													--
	requires = { 'kyazdani42/nvim-web-devicons', opt = true }}, 					-- Cool status line bar
	{ 'goolord/alpha-nvim', requires = { 'kyazdani42/nvim-web-devicons' }},			-- startup screen
	{ 'nvim-telescope/telescope.nvim', branch = '0.1.x', 							-- Fuzzy finder
		requires = { 'nvim-lua/plenary.nvim' } },
	{ 'nvim-telescope/telescope-fzf-native.nvim', 
		run = 'make', cond = vim.fn.executable "make" == 1 },-- Dart/Flutter Plugins
	'dart-lang/dart-vim-plugin',
	{'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim'},
	{'romgrk/barbar.nvim', requires = {'kyazdani42/nvim-web-devicons'}},
  	'natebosch/vim-lsc',
  	'natebosch/vim-lsc-dart',
}

require('packer').startup(function(use)
	for _, plugin in ipairs(plugins) do
		use(plugin)
  	end																							
end)

--- Non-beefy plugins 
local saga = require('lspsaga')
saga.init_lsp_saga()
require'bufferline'.setup()
require("flutter-tools").setup{} -- use defaults
require("mason").setup()
require('lualine').setup()
