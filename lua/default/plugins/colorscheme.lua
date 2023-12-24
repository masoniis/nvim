return {
	{
		"catppuccin/nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			vim.cmd([[colorscheme catppuccin]])
			-- vim.cmd("highlight Folded NONE")
			-- vim.cmd("highlight VertSplit guifg=bg")
			-- vim.cmd("highlight WinSeparator guifg=#957CC6 guibg=#2A2B3C")
			vim.cmd("highlight WinSeparator guifg=#EDC4E5 guibg=#171720")
			-- vim.cmd("highlight WinBarNC guibg=#2A2B3C")
			-- vim.cmd("highlight WinBar guibg=#2A2B3C")
			-- vim.cmd("highlight WinSeparator guifg=#EDC4E5")

			--
			-- -- Highlight inactive window "dimmed"
			-- vim.cmd("hi NeoTreeNormalNC guibg=#2A2B3C") -- neotree highlight
			-- vim.cmd("hi ActiveWindow ctermbg=16 | hi InactiveWindow ctermbg=233 guibg=#2A2B3C")
			-- vim.cmd("set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow")
			-- vim.cmd([[set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow]])
			--

			require("catppuccin").setup({
				integrations = {
					cmp = true,
					gitsigns = true,
					neotree = true,
					notify = true,
					treesitter = true,
					barbar = true,
					ufo = true,
					which_key = true,
					leap = true,
				},
			})
		end,
	},

	{
		"folke/tokyonight.nvim",
		lazy = true,
		-- lazy = false, -- make sure we load this during startup if it is your main colorscheme
		-- priority = 1000, -- make sure to load this before all the other start plugins
		-- config = function()
		-- 	vim.cmd([[colorscheme catppuccin]])
		-- 	vim.cmd("highlight Folded NONE")
		-- 	vim.cmd("highlight VertSplit ctermfg=red")
		-- end,
	},
}
