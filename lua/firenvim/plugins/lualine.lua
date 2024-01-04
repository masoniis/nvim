-- Lualine is the cool statusbar that shows mode and line and such
return {
	"nvim-lualine/lualine.nvim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	name = "lualine",
	version = "v3.*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("lualine").setup({
			options = {
				theme = "catppuccin",
			},
		})
	end,
}
