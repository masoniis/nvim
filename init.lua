local config = vim.fn.stdpath('config')


-- If this is a nvim instance inside vscode (vscode-neovim)
if vim.g.vscode then
  -- Vscode nvim
	-- Load keymaps, options, and autocmds
	require('vscode.config.autocmds')
	require('vscode.config.keymaps')
	require('vscode.config.options')

	-- Import lazy config and bootstrap and stuff
	require('vscode.config.lazy')
else
	-- Load keymaps, options, and autocmds
	require('default.config.autocmds')
	require('default.config.keymaps')
	require('default.config.options')

	-- Import lazy config and bootstrap and stuff
	require('default.config.lazy')
end

