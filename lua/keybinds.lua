local function map(m, k, v)
  vim.keymap.set(m, k, v, { silent = true })
end


map("", "<Space>", "<Nop>")
vim.g.mapleader = " "												-- Leader to space
vim.g.maplocalleader= " "											-- II

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-----------------
-- Normal Mode --
-----------------
map('n', 'j', 'gj')											-- Move through visual lines instead of logical lines
map('n', 'k', 'gk')											-- II

map('n', '<C-k>', ':wincmd k<CR>')							-- Window navigation
map('n', '<C-j>', ':wincmd j<CR>')							-- II
map('n', '<C-h>', ':wincmd h<CR>')							-- II
map('n', '<C-l>', ':wincmd l<CR>')							-- II

map("n", "<C-Up>", ":resize +2<CR>")						-- Resize with arrows
map("n", "<C-Down>", ":resize -2<CR>")						-- II
map("n", "<C-Left>", ":vertical resize -2<CR>")				-- II
map("n", "<C-Right>", ":vertical resize +2<CR>")			-- II

local builtin = require('telescope.builtin')
map('n', 'ff', builtin.find_files, {})						-- Telescope find files
map('n', 'fg', builtin.live_grep, {})						-- Telescope live grep
map('n', 'fb', builtin.buffers, {})							-- Telescope buffers
map('n', 'fh', builtin.help_tags, {})						-- Telescope help tags

map("n", "<A-j>", "<Esc>:m .+1<CR>==gi")					-- Move text up
map("n", "<A-k>", "<Esc>:m .-2<CR>==gi")					-- Move text down

-- Changing the working directory to the current file location
map('n', '<leader>cd', ':cd %:p:h<CR>:pwd<CR>')

-- All nvim-tree realted mappings --
-- Full defaults here: https://raw.githubusercontent.com/kyazdani42/nvim-tree.lua/master/doc/nvim-tree-lua.txt
map('n', '<Leader>e', ':NvimTreeToggle<CR>')

-----------------
-- Visual Mode --
-----------------
map("v", "<A-k>", ":m .-2<CR>==")							-- Move text up and down
map("v", "<A-j>", ":m .+1<CR>==")
map("v", "p", '"_dP')										-- When pasting, don't cut text pasted over

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
