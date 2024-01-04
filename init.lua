-- If this is a nvim instance inside vscode (vscode-neovim)
if vim.g.vscode then
	-- Load keymaps, options, and autocmds
	require("vscode.config.autocmds")
	require("vscode.config.keymaps")
	require("vscode.config.options")

	-- Import lazy config and bootstrap and stuff
	require("vscode.config.lazy")
elseif vim.g.started_by_firenvim then -- For web browser sessions (firenvim)
	-- Load keymaps, options, and autocmds
	require("firenvim.config.autocmds")
	require("firenvim.config.keymaps")
	require("firenvim.config.fireopts")

	-- Import lazy config and bootstrap and stuff
	require("firenvim.config.lazy")
else
	-- Load keymaps, options, and autocmds
	require("default.config.autocmds")
	require("default.config.keymaps")
	require("default.config.options")

	-- Import lazy config and bootstrap and stuff
	require("default.config.lazy")
end
