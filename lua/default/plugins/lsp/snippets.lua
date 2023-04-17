return {
	{
		"rafamadriz/friendly-snippets", -- snippets for general languages
	},
	{
		"L3MON4D3/LuaSnip",
		run = "make install_jsregexp",
		config = function ()
			require("luasnip.loaders.from_vscode").lazy_load() -- Load the general snippets lazily from friendly-snippets
		end
	},
}
