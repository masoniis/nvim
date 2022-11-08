local function map(m, k, v)
  vim.keymap.set(m, k, v, { silent = true })
end

map("", "<Space>", "<Nop>")
vim.g.mapleader = " "												-- Leader to space
vim.g.maplocalleader= " "											-- II

---------------------
-- Normal Mode (n) --
---------------------
map('n', 'j', 'gj') --- Nav visual lines instead of logical
map('n', 'k', 'gk') --- Nav visual lines instead of logical						

map('n', '<C-h>', ":call VSCodeNotify('workbench.action.navigateLeft')<CR>")  --- Window nav left
map('n', '<C-j>', ":call VSCodeNotify('workbench.action.navigateDown')<CR>")  --- Wnodow nav down
map('n', '<C-k>', ":call VSCodeNotify('workbench.action.navigateUp')<CR>")    --- Window nav up
map('n', '<C-l>', ":call VSCodeNotify('workbench.action.navigateRight')<CR>") --- Window nav right

map("n", "<A-j>", "<Esc>:m .+1<CR>==gi")  --- Move text up
map("n", "<A-k>", "<Esc>:m .-2<CR>==gi")  --- Move text down

-- Changing the working directory to the current file location
map('n', '<leader>cd', ':cd %:p:h<CR>:pwd<CR>')

-- Insert Mode (i) --

---------------------
-- Visual Mode (v) --
---------------------
map("v", "<A-k>", ":m .-2<CR>==")							-- Move text up and down
map("v", "<A-j>", ":m .+1<CR>==")
map("v", "p", '"_dP')										-- When pasting, don't cut text pasted over

-- Visual Block Mode (x) --
-- Term Mode (t) --
-- Command Mode (c) --