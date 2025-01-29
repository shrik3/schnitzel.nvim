return {
	"shrik3/dagon",
	"ntpeters/vim-better-whitespace",
	"chaoren/vim-wordmotion",
	-- programming

	-- preconfigured
	require("plugins.preconfigured.comment"),
	require("plugins.preconfigured.format"),
	require("plugins.preconfigured.git"),
	require("plugins.preconfigured.tagbar"),
	require("plugins.preconfigured.lspconfig"),
	require("plugins.preconfigured.markdown"),
	require("plugins.preconfigured.neotree"),
	require("plugins.preconfigured.nvim-cmp"),
	require("plugins.preconfigured.telescope"),
	require("plugins.preconfigured.persistence"),

	-- inactive
	-- "godlygeek/tabular",
	-- { name = "hare.vim", url = "https://git.sr.ht/~sircmpwn/hare.vim" },
	-- "shrik3/vim-aspectcpp",
	-- "compnerd/arm64asm-vim",

	-- inactive - preconfigured
	-- require("plugins.preconfigured.paste-image"),
	-- require("plugins.preconfigured.autopairs"),
	-- require("plugins.preconfigured.surround"),
	-- require("plugins.preconfigured.colorizer"),
	-- require("plugins.preconfigured.rust"),
}
