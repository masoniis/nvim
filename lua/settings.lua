local options = {
	termguicolors = true,
	number = true,
	numberwidth = 5,
	cursorline = true,
	clipboard = 'unnamedplus',					-- Neovim and OS clipboard are friends now
	tabstop=4,							-- Tab length 4 spaces
	shiftwidth=4,							-- 4 spaces when indenting with '>'
	smartcase = true,
	ignorecase = true,
	scrolloff = 8, 							-- Keep cursor centered by 8 spaces vertically
	sidescrolloff = 8,						-- Same as above but sides
}

for option, value in pairs(options) do
  vim.opt[option] = value
end

local notify_status_ok, notify = pcall(require, "notify")
if not notify_status_ok then
  return
end

vim.notify = notify
