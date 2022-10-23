local function import(module)
    package.loaded[module] = nil
    return require(module)
end

-- Vanilla Config
import('settings')
import('autocmds')
import('plugins')
import('keybinds')
import('colorscheme')

-- vim.notify("What's up, this is an awesome test message!")

-- Automatically require config in the plugins folder
for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath('config')..'/lua/plugins', [[v:val =~ '\.lua$']])) do
  require('plugins.'..file:gsub('%.lua$', ''))
end

-- Automatically require configs in the plugins/lsp folder
for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath('config')..'/lua/plugins/lsp', [[v:val =~ '\.lua$']])) do
  require('plugins.lsp.'..file:gsub('%.lua$', ''))
end
