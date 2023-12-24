return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		local wk = require("which-key")

		wk.setup({
			layout = {
				align = "center", -- align columns left, center or right
			},
			window = {
				border = "single",      -- none, single, double, shadow
				position = "bottom",  -- bottom, top
				margin = { 1, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
				padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
				winblend = 0,         -- value between 0-100 0 for fully opaque and 100 for fully transparent
				zindex = 1000,        -- positive value to position WhichKey above other floating windows.
			},
		})

		wk.register({ -- Registers to replace prefix, all other commands are defined using vim map descriptions
			["<leader>"] = { name = "swap window" },
			c = { name = "change" },
			f = { name = "file" },
			l = { name = "lsp" },
		}, { prefix = "<leader>" })
	end
}
