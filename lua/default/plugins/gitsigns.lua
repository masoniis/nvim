-- Amplifies the git integration of edits and additions
return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local gitsigns = require("gitsigns");

		gitsigns.setup({
			-- Config here, using defaults
		})
	end,
}
