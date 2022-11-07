-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

local plugins = {
	'wbthomason/packer.nvim',														-- Plugin manager

	-----------------------
	-- Essential plugins --
	-----------------------
	'nvim-lua/plenary.nvim',														-- Provides useful lua plugins, common dependency
	'nvim-treesitter/nvim-treesitter',                                              -- Highlight, edit, and navigate code
	{'nvim-treesitter/nvim-treesitter-textobjects', after = {'nvim-treesitter'}},	-- Additional textobjects for treesitter

	-------------------------
	-- Convenience plugins --
	-------------------------
	'tpope/vim-fugitive',															-- Support for :Git commands
	'folke/which-key.nvim',
	'NumToStr/Comment.nvim',														-- Easily comment stuff
	'JoosepAlviste/nvim-ts-context-commentstring',									-- Recognize what filetype to comment
	"akinsho/toggleterm.nvim",														-- Easy access to a toggle terminal
	{'romgrk/barbar.nvim', requires = {'kyazdani42/nvim-web-devicons'}},			-- Tabs for files
	{'nvim-tree/nvim-tree.lua', requires = {'nvim-tree/nvim-web-devicons'}},  		-- File tree
	{'nvim-telescope/telescope.nvim', branch = '0.1.x'},							-- Fuzzy finder
	{ 'michaelb/sniprun', run = 'bash ./install.sh'},
	'mfussenegger/nvim-dap',
	{ "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} },

	--- Auto completion
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',

	--- lsp
	'neovim/nvim-lspconfig',  														--	
	'williamboman/mason.nvim', 														-- lsp download gui
	"williamboman/mason-lspconfig.nvim",
	"jose-elias-alvarez/null-ls.nvim",												-- for formatters and linters
	"RRethy/vim-illuminate",														-- uses lsp to highlight uses of a word hovered
	"glepnir/lspsaga.nvim",
		
	--- Snippets
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",													-- Friendly snippets
	'saadparwaiz1/cmp_luasnip',														-- Make cmp and luasnip friends

	-------------------------------
	-- Language specific plugins --
	-------------------------------
	--- Dart/Flutter:
	'dart-lang/dart-vim-plugin',													-- Dart LSP
	{'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim'},				-- Flutter support

	--------------------
	-- Visual plugins --
	--------------------
	--- Themes:
	'mjlbach/onedark.nvim', 														-- Theme inspired by Atom
	'shaunsingh/nord.nvim', 														-- Cool nordic theme
	'folke/tokyonight.nvim',														-- Tokyo night theme
	'projekt0n/github-nvim-theme', 													-- Github themes
	--- Other:
	'rcarriga/nvim-notify',															-- Cool vim.notify("notifactions")
	'lewis6991/gitsigns.nvim',														-- Shows git info in side bar
	{ 'goolord/alpha-nvim', requires = { 'kyazdani42/nvim-web-devicons' }},			-- Startup screen
	{'nvim-lualine/lualine.nvim', 													-- Cool Status line bar	
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }},	
}

-- Protected call packer so don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	for _, plugin in ipairs(plugins) do
		use(plugin)
  	end																							
end)
