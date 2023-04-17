-- inject LSP diagnostics, code actions, and more via Lua
return {
	"jose-elias-alvarez/null-ls.nvim",
	-- event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"nvim-lua/plenary.nvim",
		"jay-babu/mason-null-ls.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- After mason stuff is setup, it's safe to setup regular lsp stuff
		require("mason").setup()

		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"clangd",
			},
		})

		require("lspconfig").lua_ls.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					workspace = {
						checkThirdParty = false, -- (removes annoying popup)
					},
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

		require("lspconfig").clangd.setup({})

		require("mason-null-ls").setup({
			ensure_installed = {
				"stylua",
				-- "clang_format" not needed because clangd comes with it by default
			},
			automatic_installation = false,
			automatic_setup = true, -- Recommended, but optional
		})

		-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
		-- local formatting = null_ls.builtins.formatting
		-- -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
		-- local diagnostics = null_ls.builtins.diagnostics
		require("null-ls").setup({
			sources = {
				-- formatting.stylua, -- Lua opinionated formatting
				-- formatting.clang_format,
				-- Anything not supported by mason.
			},
		})

		-- require("mason-null-ls").setup_handlers() -- If `automatic_setup` is true.
	end,
}
