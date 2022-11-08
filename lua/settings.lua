local options = {
	termguicolors = true,
	number = true,
	numberwidth = 5,
	cursorline = true,
	clipboard = 'unnamedplus',	-- Neovim and OS clipboard are friends now
	tabstop=4,					-- Tab length 4 spaces
	shiftwidth=4,				-- 4 spaces when indenting with '>'
	smartcase = true,
	ignorecase = true,
--	scrolloff = 8, 				-- Handled in VSCode settings 
--	sidescrolloff = 8,			-- Handled in VSCode settings
}

for option, value in pairs(options) do
  vim.opt[option] = value
end