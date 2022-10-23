local function map(m, k, v)
  vim.keymap.set(m, k, v, { silent = true })
end

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
map('n', '<Space>', '<Nop>')

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Move through visual lines rather than logical lines
map('n', 'j', 'gj')
map('n', 'k', 'gk')

-- Resize with arrows
map("n", "<C-Up>", ":resize +2<CR>")
map("n", "<C-Down>", ":resize -2<CR>")
map("n", "<C-Left>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")

-- Move text up and down
map("n", "<A-j>", "<Esc>:m .+1<CR>==gi")
map("n", "<A-k>", "<Esc>:m .-2<CR>==gi")
map("v", "<A-j>", ":m .+1<CR>==")
map("v", "<A-k>", ":m .-2<CR>==")
map("v", "p", '"_dP')

map('n', '<leader>A', ':Alpha')
map('n', '<leader>a', ':Alpha')

-- Changing the working directory to the current file location
map('n', '<leader>cd', ':cd %:p:h<CR>:pwd<CR>')

-- All nvim-tree realted mappings --
-- Full defaults here: https://raw.githubusercontent.com/kyazdani42/nvim-tree.lua/master/doc/nvim-tree-lua.txt
map('n', '<C-t>', ':NvimTreeToggle<CR>')

-- LSP CONFIG
--map('n', 'gd', ':Lspsaga peek_definition<CR>')
--map('n', 'gr', ':Lspsaga rename<CR>')
--map({'n','v'}, '<leader>ca', ':Lspsaga code_action<CR>')
--map('n', '<leader>o', ':LSoutlineToggle<CR>')

----------------------------------------
-- Barber mappings
--- Reorder tabs to previous/next
map('n', '<A->>', ':BufferMoveNext<CR>')
map('n', '<A-<>', ':BufferMovePrevious<CR>')

--- Go to next or previous tabs
map('n', '<leader>.', ':BufferNext<CR>')
map('n', '<leader>,', ':BufferPrevious<CR>')

--- Close tabs
map('n', '<A-c>', ':BufferClose<CR>')

--------------------------------------
-- Window navigation
map('n', '<leader>k', ':wincmd k<CR>')
map('n', '<leader>j', ':wincmd j<CR>')
map('n', '<leader>h', ':wincmd h<CR>')
map('n', '<leader>l', ':wincmd l<CR>')

----- Telescope
local builtin = require('telescope.builtin')
map('n', 'ff', builtin.find_files, {})
map('n', 'fg', builtin.live_grep, {})
map('n', 'fb', builtin.buffers, {})
map('n', 'fh', builtin.help_tags, {})
