return {
	"mrjones2014/smart-splits.nvim",
	config = function()
		require("smart-splits").setup({
			cursor_follows_swapped_bufs = true, -- When swapping, follow with the swap window (default false)
			default_amount = 1,              -- set default resize interval to 1 instead of 3
			-- wrap_at_edge = false, -- disable circular wrapping because of wezterm wrap delay
		})
	end,
	keys = {
		-- swapping buffers between windows
		{
			"<leader><leader>h",
			function() require("smart-splits").swap_buf_left() end,
			desc = "Swap buffer leftward"
		},
		{
			"<leader><leader>j",
			function() require("smart-splits").swap_buf_down() end,
			desc = "Swap buffer downward"
		},
		{
			"<leader><leader>k",
			function() require("smart-splits").swap_buf_up() end,
			desc = "Swap buffer upward"
		},
		{
			"<leader><leader>l",
			function() require("smart-splits").swap_buf_right() end,
			desc = "Swap buffer rightward"
		},

		-- moving between splits
		{
			"<C-h>",
			function() require("smart-splits").move_cursor_left() end,
			desc = "Move cursor a window left"
		},
		{
			"<C-j>",
			function() require("smart-splits").move_cursor_down() end,
			desc = "Move cursor a window down"
		},
		{
			"<C-k>",
			function() require("smart-splits").move_cursor_up() end,
			desc = "Move cursor a window up"
		},
		{
			"<C-l>",
			function() require("smart-splits").move_cursor_right() end,
			desc = "Move cursor a window right"
		},

		-- resizing splits, `10<A-h>` will resize by `(10 * config.default_amount)
		{
			"<A-h>",
			function() require("smart-splits").resize_left() end,
			desc = "Resize wiwindow right"
		},
		{
			"<A-j>",
			function() require("smart-splits").resize_down() end,
			desc = "Resize wiwindow down"
		},
		{
			"<A-k>",
			function() require("smart-splits").resize_up() end,
			desc = "Resize wiwindow up"
		},
		{
			"<A-l>",
			function() require("smart-splits").resize_right() end,
			desc = "Resize wiwindow up"
		},
	}
}
