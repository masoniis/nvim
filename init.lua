local function import(module)
    package.loaded[module] = nil
    return require(module)
end

import('settings')
import('autocmds')
import('plugins')
import('keybinds')

for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath('config')..'/lua/plugins', [[v:val =~ '\.lua$']])) do
    import('plugins.'..file:gsub('%.lua$', ''))
end