return {
	"glacambre/firenvim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme

	-- Lazy load firenvim
	-- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
	-- lazy = not vim.g.started_by_firenvim,
	build = function()
		vim.fn["firenvim#install"](0)
	end,
}
