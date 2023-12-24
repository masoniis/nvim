return {
	'romgrk/barbar.nvim',
	dependencies = {
		'lewis6991/gitsigns.nvim',   -- OPTIONAL: for git status
		'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
	},
	init = function() vim.g.barbar_auto_setup = false end,
	opts = {
		icons = {
			separator = { left = '┃', right = '' },
			separator_at_end = false,
		},
		sidebar_filetypes = {
			['neo-tree'] = { event = 'BufWipeout', text = "file tree" },
		},
	},
}
