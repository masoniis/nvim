local function import(module)
    package.loaded[module] = nil
    return require(module)
end

-- Vanilla Config
import('settings')
import('autocmd')
import('plugins')
import('keybinds')

-- Automatically require configs in the plugins folder
for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath('config')..'/lua/plugins', [[v:val =~ '\.lua$']])) do
  require('plugins.'..file:gsub('%.lua$', ''))
end
