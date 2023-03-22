return {
	"jose-elias-alvarez/null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "mason.nvim" },
	config = function()
		local null_ls_status_ok, null_ls = pcall(require, "null-ls")
		if not null_ls_status_ok then
			vim.notify("null_ls failed to initialize.")
			return
		end

		-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
		local formatting = null_ls.builtins.formatting
		-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
		local diagnostics = null_ls.builtins.diagnostics

		null_ls.setup({
			debug = false,
			sources = {
				-- Lua formatting
				formatting.stylua,
			},
		})
	end
}
