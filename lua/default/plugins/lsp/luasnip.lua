return {
	"L3MON4D3/LuaSnip",
	event = { "BufReadPre", "BufNewFile" },
	version = "<CurrentMajor>.*", -- follow latest release.
	build = "make install_jsregexp", -- install jsregexp (optional!).
}
