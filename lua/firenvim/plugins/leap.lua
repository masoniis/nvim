return {
	"ggandor/leap.nvim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "tpope/vim-repeat" },
	config = function()
		require("leap").add_default_mappings()
		vim.api.nvim_del_keymap("v", "x")
		vim.api.nvim_del_keymap("v", "X")
	end,
}
