return {
	"shrik3/dagon",
	"ntpeters/vim-better-whitespace",
	"godlygeek/tabular",
	"chaoren/vim-wordmotion",

	{ name = "hare.vim", url = "https://git.sr.ht/~sircmpwn/hare.vim" },
	"shrik3/vim-aspectcpp",
	"compnerd/arm64asm-vim",

	-- preconfigured
	require("plugins.preconfigured.comment"),
	require("plugins.preconfigured.format"),
	require("plugins.preconfigured.git"),
	require("plugins.preconfigured.tagbar"),
	require("plugins.preconfigured.lspconfig"),
	require("plugins.preconfigured.markdown"),
	require("plugins.preconfigured.neotree"),
	require("plugins.preconfigured.rust"),
	require "plugins.preconfigured.nvim-cmp",
	require("plugins.preconfigured.telescope"),
	require("plugins.preconfigured.persistence"),
	require("plugins.preconfigured.autopairs"),
	require("plugins.preconfigured.bookmarks"),
	require("plugins.preconfigured.colorizer"),
	require("plugins.preconfigured.paste-image"),

	-- inactive - preconfigured
	-- require("plugins.preconfigured.surround"),
}
