return {
	"neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      	{ "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      	{ "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
      	"mason.nvim",
      	"williamboman/mason-lspconfig.nvim",
    	"hrsh7th/cmp-nvim-lsp",
    },
	config = function()
		local lspconfig = require('lspconfig')

		-- Lua language server
		lspconfig.lua_ls.setup {}
		-- lspconfig.pyright.setup {}
		-- lspconfig.tsserver.setup {}
	end
}
