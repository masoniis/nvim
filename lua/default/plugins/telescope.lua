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

		telescope.setup({
			defaults = {
				-- Default configuration for telescope goes here:
				-- config_key = value,
				mappings = {},
			},
			pickers = {
				-- Default configuration for builtin pickers goes here:
				-- picker_name = {
				--   picker_config_key = value,
				--   ...
				-- }
				-- Now the picker_config_key will be applied every time you call this
				-- builtin picker
			},
			extensions = {
				-- Your extension configuration goes here:
				-- extension_name = {
				--   extension_config_key = value,
				-- }
				-- please take a look at the readme of the extension you want to configure
			},
		})
	end,
}
