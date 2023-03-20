local import_dir = require('helpers.loader').import_dir
local config = vim.fn.stdpath('config')

-- If this is a nvim instance inside vscode (vscode-neovim)
if vim.g.vscode then
    -- Vscode nvim
    import_dir(config .. '/lua/vscode')
else
    -- Normal nvim:
    import_dir(config .. '/lua/default')
end
