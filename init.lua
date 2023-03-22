local import_dir, import = require('module_loader').import_dir, require('module_loader').import
local config = vim.fn.stdpath('config')

-- Bootstrap lazyvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Imports that aren't specific to vscode neovim or default nvim
import_dir(config .. '/lua/common')

-- If this is a nvim instance inside vscode (vscode-neovim)
if vim.g.vscode then
  -- Vscode nvim
  import_dir(config .. '/lua/vscode')
  require("lazy").setup("vscode.plugins")
else
  -- Normal nvim:
  import_dir(config .. '/lua/default')
  require("lazy").setup("default.plugins")
end

