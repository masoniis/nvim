local function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true })
end

-- Map leader to nothing to make sure it is empty
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--    normal_mode = "n",
--    insert_mode = "i",
--    visual_mode = "v",
--    visual_block_mode = "x",
--   	term_mode = "t",
--		command_mode = "c",

-----------------
-- Normal Mode --
-----------------
map("n", "j", "gj") -- Move through visual lines instead of logical lines
map("n", "k", "gk")

-----------------
-- Visual Mode --
-----------------
-- map("v", "
-- map("v", "<A-j>", ":m .+1<CR>==")
-- map("v", "p", '"_dP') -- When pasting, don't cut text pasted over
--
-- --- Terminal mode to navigate in and out
map('t', '<esc>', [[<C-\><C-n>]])
-- -- Having this keybind makes normal j navigationi n terminal slow
-- map('t', '<C-h>', [[<Cmd>wincmd h<CR>]])
map('t', '<C-j>', [[<Cmd>wincmd j<CR>]])
map('t', '<C-k>', [[<Cmd>wincmd k<CR>]])
map('t', '<C-l>', [[<Cmd>wincmd l<CR>]])
map('t', '<C-w>', [[<C-\><C-n><C-w>]])
