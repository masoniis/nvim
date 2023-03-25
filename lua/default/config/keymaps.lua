local function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true })
end

--- Leader key
-- Map leader to nothing to make sure it is empty
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
-- command_mode = "c",

-----------------
-- Normal Mode --
-----------------
map("n", "j", "gj") -- Move through visual lines instead of logical lines
map("n", "k", "gk") -- II

map("n", "<C-k>", ":wincmd k<CR>") -- Window navigation
map("n", "<C-j>", ":wincmd j<CR>") -- II


map("n", "<C-h>", ":wincmd h<CR>") -- II
map("n", "<C-l>", ":wincmd l<CR>") -- II

map("n", "<C-Up>", ":resize +2<CR>") -- Resize with arrows
map("n", "<C-Down>", ":resize -2<CR>") -- II
map("n", "<C-Left>", ":vertical resize -2<CR>") -- II
map("n", "<C-Right>", ":vertical resize +2<CR>") -- II

map("n", "<A-j>", "<Esc>:m .+1<CR>==gi") -- Move text up
map("n", "<A-k>", "<Esc>:m .-2<CR>==gi") -- Move text down

-- Changing the working directory to the current file location
map("n", "<leader>cd", ":cd %:p:h<CR>:pwd<CR>")

-----------------
-- Visual Mode --
-----------------
map("v", "<A-k>", ":m .-2<CR>==") -- Move text up and down
map("v", "<A-j>", ":m .+1<CR>==")
map("v", "p", '"_dP') -- When pasting, don't cut text pasted over

----------------------------------------
-- Barber mappings
--- Reorder tabs to previous/next
map("n", "<A->>", ":BufferMoveNext<CR>")
map("n", "<A-<>", ":BufferMovePrevious<CR>")

--- Go to next or previous tabs
map("n", "<leader>.", ":BufferNext<CR>")
map("n", "<leader>,", ":BufferPrevious<CR>")

--- Close tabs
map("n", "<A-c>", ":BufferClose<CR>")

--- Terminal mode to navigate in and out
map('t', '<esc>', [[<C-\><C-n>]])
-- Having this keybind makes normal j navigationi n terminal slow
--map('t', 'jk', [[<C-\><C-n>]])
map('t', '<C-h>', [[<Cmd>wincmd h<CR>]])
map('t', '<C-j>', [[<Cmd>wincmd j<CR>]])
map('t', '<C-k>', [[<Cmd>wincmd k<CR>]])
map('t', '<C-l>', [[<Cmd>wincmd l<CR>]])
map('t', '<C-w>', [[<C-\><C-n><C-w>]])
