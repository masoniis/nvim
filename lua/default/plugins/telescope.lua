return {
	"nvim-telescope/telescope.nvim", -- fuzzy finder
	dependencies = { "BurntSushi/ripgrep", "nvim-lua/plenary.nvim" },
	config = function()
		local status_ok, telescope = pcall(require, "telescope")
		if not status_ok then
			vim.notify("Telescope failed to initialize.")
			return

		end

		-- Extension for project.nvim
		telescope.load_extension("projects")

		telescope.setup({})
	end,
	cmd = "Telescope", -- lazy load on any telescope cmd
	keys = {
		{"<leader>f", "", desc = "file cmds"}, -- Used so whichkey will name the category
		{"<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Search pwd files" },
		{"<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Search live grep" },
		{"<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Search recent files" }
	}
}
