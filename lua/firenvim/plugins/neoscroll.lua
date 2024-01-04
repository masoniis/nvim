-- return {
--   "karb94/neoscroll.nvim",
--   config = function ()
--     require('neoscroll').setup({
-- 			hide_cursor = false,
-- 			easing_function = "circular"
-- 		})
--   end
-- }
return {
	"declancm/cinnamon.nvim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	config = function()
		require("cinnamon").setup({
			default_keymaps = true, -- Create default keymaps.
			extra_keymaps = true, -- Create extra keymaps.
			extended_keymaps = true, -- Create extended keymaps.
			override_keymaps = false, -- The plugin keymaps will override any existing keymaps.

			scroll_limit = 80,
		})
	end,
}

-- Scroll test point

-- Scroll point 2

-- Scroll point 3
