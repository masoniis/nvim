local api = vim.api

-- Highlight on yank
local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank()",
  group = yankGrp,
})

-- Check if we need to reload the file when it changed
api.nvim_create_autocmd("FocusGained", { command = [[:checktime]] })

-- don't auto comment new line
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- Automatically run PackerCompile when saving plugins.lua
api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
    pattern = 'plugins.lua',
    command = 'source <afile> | PackerCompile',
})

--------------------------------------------------------
-- Barber Autocommand to add files separate from file tree
--api.nvim_create_autocmd('BufWinEnter', {
--  pattern = '*',
--  callback = function()
--  if vim.bo.filetype == 'NvimTree' then
--      require'bufferline.api'.set_offset(31, 'FileTree')
--    end
--  end
--})
--
--api.nvim_create_autocmd('BufWinLeave', {
--  pattern = '*',
--  callback = function()
--    if vim.fn.expand('<afile>'):match('NvimTree') then
--      require'bufferline.api'.set_offset(0)
--    end
--  end
--})

