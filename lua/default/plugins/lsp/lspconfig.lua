-- Controls the language servers for environments, and assists completion (cmp)
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
		lspconfig.lua_ls.setup({ capabilities = capabilities })
		lspconfig.clangd.setup({ capabilities = capabilities })

		-- Following lines are from : https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#show-line-diagnostics-automatically-in-hover-window
		vim.diagnostic.config({
			virtual_text = false,
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = false,
		})
		-- You will likely want to reduce updatetime which affects CursorHold
		-- note: this setting is global and should be set only once
		vim.o.updatetime = 250
		vim.cmd([[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])

		vim.api.nvim_create_autocmd("CursorHold", {
			buffer = bufnr,
			callback = function()
				local opts = {
					focusable = false,
					close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
					border = "rounded",
					source = "always",
					prefix = " ",
					scope = "cursor",
				}
				vim.diagnostic.open_float(nil, opts)
			end,
		})
	end,
}
