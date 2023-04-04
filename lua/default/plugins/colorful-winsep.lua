return {
	"nvim-zh/colorful-winsep.nvim",
	config = function()
		require("colorful-winsep").setup({
			-- highlight for Window separator
			highlight = {
				bg = "#2A2B3C",
				fg = "#957CC6",
			},
			-- timer refresh rate
			interval = 30,
			-- This plugin will not be activated for filetype in the following table.
			no_exec_files = { "packer", "TelescopePrompt", "mason", "CompetiTest", "NvimTree" },
			-- Symbols for separator lines, the order: horizontal, vertical, top left, top right, bottom left, bottom right.
			symbols = { "━", "┃", "┏", "┓", "┗", "┛" },
			close_event = function()
				-- Executed after closing the window separator
			end,
			create_event = function()
				-- Executed after creating the window separator
			end,
		})
	end,
	event = { "WinNew" },
	init = function()
		-- -- Highlight active window // dim inactive
		vim.cmd("hi ActiveWindow ctermbg=16 | hi InactiveWindow ctermbg=233 guibg=#2A2B3C")
		vim.cmd("set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow")
		vim.cmd([[set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow]])
	end,
}
