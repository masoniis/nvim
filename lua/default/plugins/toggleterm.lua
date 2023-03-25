return {
	"akinsho/toggleterm.nvim",
	version = "*",
	keys = {
		{ "<c-t>", ":silent ToggleTerm direction=horizontal<CR>", desc = "Toggle normal term" },
		-- { "<leader>ft", ":ToggleTerm direction=float<CR>", desc = "Toggle floating term"}
	},
	opts = {
		open_mapping = [[<c-t>]]
	},
}
