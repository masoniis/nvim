return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v2.x",
	keys = {
		{ "<leader>e", "<cmd>NeoTreeShowToggle<cr>", desc = "Neotree default" },
		{ "<leader>fe", "<cmd>NeoTreeFloatToggle<cr>", desc = "Neotree float" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
}
