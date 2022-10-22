local function map(m, k, v)
  vim.keymap.set(m, k, v, { silent = true })
end

-- Move through visual lines rather than logical lines
map('n', 'j', 'gj')
map('n', 'k', 'gk')

-- Changing the working directory to the current file location
map('n', '<leader>cd', ':cd %:p:h<CR>:pwd<CR>')

-- All nvim-tree realted mappings --
-- Full defaults here: https://raw.githubusercontent.com/kyazdani42/nvim-tree.lua/master/doc/nvim-tree-lua.txt
map('n', '<C-t>', ':NvimTreeToggle<CR>')

-- LSP CONFIG
map('n', 'gd', ':Lspsaga peek_definition<CR>')
map('n', 'gr', ':Lspsaga rename<CR>')
map({'n','v'}, '<leader>ca', ':Lspsaga code_action<CR>')
map('n', '<leader>o', ':LSoutlineToggle<CR>')

----------------------------------------
-- Barber mappings
--- Reorder tabs to previous/next
map('n', '<A->>', ':BufferMoveNext<CR>')
map('n', '<A-<>', ':BufferMovePrevious<CR>')

--- Go to next or previous tabs
map('n', '<leader>.', ':BufferNext<CR>')
map('n', '<leader>,', ':BufferPrevious<CR>')

--- Go to certain position
map('n', '<A-1>', ':BufferGoTo 1<CR>')
map('n', '<A-2>', ':BufferGoTo 2<CR>')
map('n', '<A-3>', ':BufferGoTo 3<CR>')
map('n', '<A-4>', ':BufferGoTo 4<CR>')
map('n', '<A-5>', ':BufferGoTo 5<CR>')
map('n', '<A-6>', ':BufferGoTo 6<CR>')
map('n', '<A-7>', ':BufferGoTo 7<CR>')
map('n', '<A-8>', ':BufferGoTo 8<CR>')
map('n', '<A-9>', ':BufferGoTo 9<CR>')
map('n', '<A-0>', ':BufferGoTo 0<CR>')

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

