return {
	"nvim-telescope/telescope.nvim", -- fuzzy finder
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	dependencies = { "BurntSushi/ripgrep", "nvim-lua/plenary.nvim" },
	config = function()
		local status_ok, telescope = pcall(require, "telescope")
		if not status_ok then
			vim.notify("Telescope failed to initialize.")
			return
		end

		telescope.setup({})
	end,
	cmd = "Telescope", -- lazy load on any telescope cmd
	keys = {
		{ "<leader>f", "", desc = "file cmds" }, -- Used so whichkey will name the category
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "search pwd files" },
		{ "<leader>d", "<cmd>Telescope diagnostics<cr>", desc = "lsp diagnostics" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "search live grep" },
		{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "search recent files" },
		{ "<leader>p", "<cmd>Telescope commands<cr>", desc = "search commands" },
		{ "<C-p>", ":lua require'telescope.builtin'.git_files{use_git_root=false}<CR>", desc = "search git repo" },
		{ "<C-f>", "<cmd>Telescope current_buffer_fuzzy_find <CR>", "current buffer fuzzy find" },
	},
}
