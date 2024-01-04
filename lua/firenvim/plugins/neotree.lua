return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v2.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{
			"<leader>e",
			"<cmd>NeoTreeShowToggle<cr>",
			desc = "neotree explorer"
		},
		{
			"<leader>E",
			"<cmd>NeoTreeFloatToggle<cr>",
			desc = "neotree float"
		},
	},
}
