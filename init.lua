local function import(module)
    package.loaded[module] = nil
    return require(module)
end

if vim.g.vscode then
	import('settings')
	import('autocmds')
	import('plugins')
	import('keybinds')

	for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath('config')..'/lua/plugins', [[v:val =~ '\.lua$']])) do
		import('plugins.'..file:gsub('%.lua$', ''))
	end
else
	import('settings')
	import('autocmds')
	import('plugins')
	import('keybinds')
	import('colorscheme')

	-- Automatically require config in the plugins folder
	for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath('config')..'/lua/plugins', [[v:val =~ '\.lua$']])) do
		import('plugins.'..file:gsub('%.lua$', ''))
	end

	-- Automatically require configs in the plugins/lsp folder
	for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath('config')..'/lua/plugins/lsp', [[v:val =~ '\.lua$']])) do
		import('plugins.lsp.'..file:gsub('%.lua$', ''))
	end

	import("plugins.lsp.handlers").setup()
end
