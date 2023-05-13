local api = vim.api

-- Highlight on yank
local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
	command = "silent! lua vim.highlight.on_yank()",
	group = yankGrp,
})

-- Check if we need to reload the file when it changed
api.nvim_create_autocmd("FocusGained", { command = [[:checktime]] })

-- Don't auto comment new line
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- Auto enter terminal when tabbing into a terminal pane
api.nvim_create_autocmd("TermOpen", { command = [[startinsert]] })
api.nvim_create_autocmd("TermOpen", { command = [[setlocal nonumber norelativenumber]] }) --- Remove line numbers in a terminal
-- api.nvim_create_autocmd("TermOpen", { command = [[set ma]] }) --- SOMEWHAT DANGEROUS: sets terminal buffers to modifable to take use of vim -a vi
api.nvim_create_autocmd("BufEnter,WinEnter", {pattern = {"term://*"}, command = "startinsert", nested = true}) -- Inter insert mode on window temrinal focus

-- When entering command mode, set height to 1 in order to shift statusline up so it remains visible
api.nvim_create_autocmd("CmdlineEnter", {
	command = ":set cmdheight=1",
})

-- When leaving, set height back to 0 to hide command line
api.nvim_create_autocmd("CmdlineLeave", {
	command = ":set cmdheight=0",
})
