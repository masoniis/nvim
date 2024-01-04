return {
	"nvim-zh/colorful-winsep.nvim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	config = function()
		require("colorful-winsep").setup({
			-- Winsep color
			highlight = {
				-- bg = "#2A2B3C",
				-- fg = "#957CC6",
				bg = "#171720",
				fg = "#EDC4E5",
			},
			no_exec_files = { "packer", "TelescopePrompt", "mason", "CompetiTest", "NvimTree" },
			-- Symbols: hor, vert, top left, top right, bot left, bot right.
			symbols = { "━", "┃", "┏", "┓", "┗", "┛" },
		})
	end,
	event = { "WinNew" },
	init = function()
		vim.cmd("highlight WinSeparator guifg=#EDC4E5")
		-- Remove the highlighting of the dividers between splits
		-- vim.cmd("highlight VertSplit guifg=bg")
		-- vim.cmd("highlight WinSeparator guifg=#957CC6 guibg=#2A2B3C")
		-- vim.cmd("highlight WinBarNC guibg=#917DC1")
		-- vim.cmd("highlight WinBar guibg=#917DC1")
		-- vim.cmd("highlight WinBarNC guibg=#2A2B3C")
		-- vim.cmd("highlight WinBar guibg=#2A2B3C")

		-- -- Highlight active window // dim inactive
		-- vim.cmd("hi ActiveWindow ctermbg=16 | hi InactiveWindow ctermbg=233 guibg=#2A2B3C")
		-- vim.cmd("set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow")
		-- vim.cmd([[set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow]])
	end,
}
