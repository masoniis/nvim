local import_dir, import = require('module_loader').import_dir, require('module_loader').import
local config = vim.fn.stdpath('config')

-- If this is a nvim instance inside vscode (vscode-neovim)
if vim.g.vscode then
    -- Vscode nvim
    import_dir(config .. '/lua/vscode')
else
    -- Normal nvim:
    import_dir(config .. '/lua/default')
end

-- Imports that aren't specific to vscode neovim or default nvim
import('settings')
