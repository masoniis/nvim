-- Lualine is the cool statusbar that shows mode and line and such
return {
	"nvim-lualine/lualine.nvim",
	name = "lualine",
	version = "v3.*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("lualine").setup({})
	end,
}
