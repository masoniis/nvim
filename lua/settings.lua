-- See `:help vim.o`
local g = vim.g
local o = vim.o

-- Set colorscheme
vim.o.termguicolors = true
vim.cmd[[colorscheme tokyonight]]
-- vim.cmd[[colorscheme tokyonight-night]]

--- Map leader to space
g.mapleader = ' '
g.maplocalleader = ' '

o.number = true
o.numberwidth = 5
o.cursorline = true

-- Makes neovim and host OS clipboard play nicely with each other
o.clipboard = 'unnamedplus'

-- show existing tab with 4 spaces width
o.tabstop=4
-- when indenting with '>', use 4 spaces width
o.shiftwidth=4

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

-- Keep cursor centered
o.scrolloff = 8 -- is one of my fav
o.sidescrolloff = 8
