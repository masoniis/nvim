return {
	"folke/which-key.nvim",
	config = function()
		local status_ok, wk = pcall(require, "which-key")
		if not status_ok then
			vim.notify("which-key failed to initialize.")
			return
		end

		-- Maybe add commands for split screen where vertical is | and horizontal is - or _
		wk.register({
			["<leader>"] = {
				a = { "<cmd>Alpha<cr>", "Alpha" },
				f = {
					name = "+file/float",
					f = { "<cmd>Telescope find_files<cr>", "Find File" },
					r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
					n = { "<cmd>enew<cr>", "New File" },
				},
				F = { "<cmd>lua vim.lsp.buf.format {async = false}<cr>", "Format" },
			},
		})

		wk.setup({
			presets = {
				operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
				motions = true, -- adds help for motions
				text_objects = true, -- help for text objects triggered after entering an operator
				windows = true, -- default bindings on <c-w>
				nav = true, -- misc bindings to work with windows
				z = true, -- bindings for folds, spelling and others prefixed with z
				g = true, -- bindings for prefixed with g
			},
			layout = {
				height = { min = 4, max = 25 }, -- min and max height of the columns
				width = { min = 20, max = 50 }, -- min and max width of the columns
				spacing = 3, -- spacing between columns
				align = "center", -- align columns left, center or right
			},
		})
	end,
}
