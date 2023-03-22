local options = {
	termguicolors = true,
	number = true,
	numberwidth = 5,
	cursorline = true,
	clipboard = "unnamedplus", -- Neovim and OS clipboard are friends now
	tabstop = 4, -- Tab length 4 spaces
	shiftwidth = 4, -- 4 spaces when indenting with '>'
	smartcase = true,
	ignorecase = true,
	-- Fold based on indents rather than manual
	cmdheight = 0, -- When a command is not being typed, height is 0 instead of 1 line
	scrolloff = 8, -- Handled in VSCode settings, makes it so it starts scrolling before cursor reaches e
	sidescrolloff = 8, -- Handled in VSCode settings
	laststatus = 3,
}

for option, value in pairs(options) do
	vim.opt[option] = value
end
