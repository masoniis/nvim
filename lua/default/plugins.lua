-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
	vim.cmd [[packadd packer.nvim]]
end

local plugins = {
	'wbthomason/packer.nvim', -- Working	
	'nvim-lua/plenary.nvim', -- Probably working
	'NumToStr/Comment.nvim',
	-- { 'michaelb/sniprun', run = 'bash ./install.sh' }, -- Wr

	--------------------
	-- Visual plugins --
	--------------------
	--- Themes:
	'mjlbach/onedark.nvim',     -- Theme inspired by Atom
	'shaunsingh/nord.nvim',     -- Cool nordic theme
	'folke/tokyonight.nvim',    -- Tokyo night theme
	'projekt0n/github-nvim-theme', -- Github themes

}

-- Protected call packer so don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	vim.notify("Packer failed to initialize.")
	return
end

return packer.startup(function(use)
	for _, plugin in ipairs(plugins) do
		use(plugin)
	end
end)
