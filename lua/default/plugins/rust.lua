return {
	{
		"simrat39/rust-tools.nvim",

		event = "FileType rust",

		config = function()
			local rt = require("rust-tools")

			-- Cargo related commands
			-- vim.keymap.set("n", "<leader>C", " ", { desc = "Cargo" })

			vim.keymap.set("n", "<leader>Cr", "<cmd>Cargo run<CR>", {
				noremap = true,
				silent = true,
				desc = "Cargo run",
			})

			vim.keymap.set("n", "<leader>Cb", "<cmd>Cargo build<CR>", {
				noremap = true,
				silent = true,
				desc = "Cargo build",
			})

			rt.setup({
				server = {
					on_attach = function(_, bufnr)
						-- Hover actions
						vim.keymap.set(
							"n",
							"<C-space>",
							rt.hover_actions.hover_actions,
							{ buffer = bufnr, desc = "Rust tools hover" }
						)
						-- Code action groups
						vim.keymap.set(
							"n",
							"<Leader>a",
							rt.code_action_group.code_action_group,
							{ buffer = bufnr, desc = "Rust tools group action" }
						)
					end,
				},
			})
		end,
	},

	{
		"rust-lang/rust.vim",

		event = "FileType rust",

		config = function()
			-- Set rust exclusive fmt since fmt is downloaded externally instead of through Mason
		end,
	},
	-- {
	-- 	'saecki/crates.nvim',
	-- 	tag = 'stable',
	-- 	dependencies = { 'nvim-lua/plenary.nvim' },
	-- 	config = function()
	-- 		require('crates').setup()
	-- 	end,
	-- }
}

-- 	{
-- 		"saecki/crates.nvim",
-- 		dependencies = {
-- 			"plenary.nvim",
-- 		},
--
-- 		config = function()
-- 			require("crates").setup()
-- 		end,
--
-- 		event = "BufRead Cargo.toml",
--
-- 		keys = {
-- 			{ "<Leader>C",  "",                                                           desc = "Cargo cmds" },
-- 			{ "<Leader>Ct", "<Cmd>lua require(\"crates\").toggle()<CR>",                  desc = "Toggle Crates" },
-- 			{ "<Leader>Cr", "<Cmd>lua require(\"crates\").reload()<CR>",                  desc = "Reload Crates" },
--
-- 			{ "<Leader>Cv", "<Cmd>lua require(\"crates\").show_versions_popup()<CR>",     desc = "Show Crate Versions" },
-- 			{ "<Leader>Cf", "<Cmd>lua require(\"crates\").show_features_popup()<CR>",     desc = "Show Crate Features" },
-- 			{ "<Leader>Cd", "<Cmd>lua require(\"crates\").show_dependencies_popup()<CR>", desc = "Show Crate Dependencies" },
--
-- 			{ "<Leader>Cu", "<Cmd>lua require(\"crates\").update_crate()<CR>",            desc = "Update Crate" },
-- 			{ "<Leader>Cu", "<Cmd>lua require(\"crates\").update_crates()<CR>",           mode = "v",                       desc = "Update Crates" },
-- 			{ "<Leader>Ca", "<Cmd>lua require(\"crates\").update_all_crates()<CR>",       desc = "Update All Crates" },
--
-- 			{ "<Leader>CU", "<Cmd>lua require(\"crates\").upgrade_crate()<CR>",           desc = "Upgrade Crate" },
-- 			{ "<Leader>CU", "<Cmd>lua require(\"crates\").upgrade_crates()<CR>",          mode = "v",                       desc = "Upgrade Crates" },
-- 			{ "<Leader>CA", "<Cmd>lua require(\"crates\").upgrade_all_crates()<CR>",      desc = "Upgrade All Crates" },
--
-- 			{ "<Leader>CH", "<Cmd>lua require(\"crates\").open_homepage()<CR>",           desc = "Open Crate Homepage" },
-- 			{ "<Leader>CR", "<Cmd>lua require(\"crates\").open_repository()<CR>",         desc = "Open Crate Repository" },
-- 			{ "<Leader>CD", "<Cmd>lua require(\"crates\").open_documentation()<CR>",      desc = "Open Crate Documentation" },
-- 			{ "<Leader>CC", "<Cmd>lua require(\"crates\").open_crates_io()<CR>",          desc = "Open crates.io" },
-- 		},
-- 	},
-- }
