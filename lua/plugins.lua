-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

local plugins = {
	-- Package manager
	'wbthomason/packer.nvim',														-- Plugin manager

	-----------------------
	-- Essential plugins --
	-----------------------
	'neovim/nvim-lspconfig',  														--	
	'nvim-lua/plenary.nvim',														--
	'glepnir/lspsaga.nvim',															--	
  	'natebosch/vim-lsc',															--
  	'natebosch/vim-lsc-dart',														--
	'nvim-treesitter/nvim-treesitter',                                              -- Highlight, edit, and navigate code
	{'nvim-treesitter/nvim-treesitter-textobjects', after = {'nvim-treesitter'}},	-- Additional textobjects for treesitter

	------------------------
	-- Convenience plugins--
	------------------------
	'tpope/vim-fugitive',															-- Support for :Git commands
	'williamboman/mason.nvim', 														-- Cool lsp download gui
	{'romgrk/barbar.nvim', requires = {'kyazdani42/nvim-web-devicons'}},			-- Tabs for files
	{'nvim-tree/nvim-tree.lua', requires = {'nvim-tree/nvim-web-devicons'}},  		-- File tree
	{ 'nvim-telescope/telescope.nvim', branch = '0.1.x', 							-- Fuzzy finder
		requires = { 'nvim-lua/plenary.nvim' } },

	-------------------------------
	-- Language specific plugins --
	-------------------------------
	--- Dart/Flutter:
	'dart-lang/dart-vim-plugin',													-- Dart LSP
	{'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim'},				-- Flutter support

	-------------------
	-- Visual plugins--
	-------------------
	--- Themes:
	'mjlbach/onedark.nvim', 														-- Theme inspired by Atom
	'shaunsingh/nord.nvim', 														-- Cool nordic theme
	'folke/tokyonight.nvim',														-- Tokyo night theme
	'projekt0n/github-nvim-theme', 													-- Github themes
	--- Other:
	{ 'goolord/alpha-nvim', requires = { 'kyazdani42/nvim-web-devicons' }},			-- Startup screen
	{'nvim-lualine/lualine.nvim', 													-- Cool Status line bar	
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }},	
}

require('packer').startup(function(use)
	for _, plugin in ipairs(plugins) do
		use(plugin)
  	end																							
end)
