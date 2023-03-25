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
		local lspconfig = require("lspconfig")
		-- Nvim cmp default capabilities
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Lua language server
		lspconfig.lua_ls.setup({capabilities = capabilities})
		lspconfig.clangd.setup({capabilities = capabilities})
	end,
}
