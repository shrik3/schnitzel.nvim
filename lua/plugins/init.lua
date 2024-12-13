return {
	"shrik3/dagon",
	-- tagbar shows a bar of tags
	"ntpeters/vim-better-whitespace",
	-- displays color for HEX color code
	-- split VeryLongWords for easier w nav
	-- "chaoren/vim-wordmotion",
	"godlygeek/tabular",
	-- split VeryLongWords for easier w nav
	"chaoren/vim-wordmotion",
	-- harelang support
	-- { name = "hare.vim", url = "https://git.sr.ht/~sircmpwn/hare.vim" },
	-- AspectC++ highlighting
	-- "shrik3/vim-aspectcpp",
	-- aarch64 assembly syntax hl
	-- "compnerd/arm64asm-vim",
	-- {
	-- 	"HakonHarnes/img-clip.nvim",
	-- 	event = "VeryLazy",
	-- },
	-- "compnerd/arm64asm-vim",
	-- copy paste images
	-- { "HakonHarnes/img-clip.nvim", event = "VeryLazy" },
	-- other preconfigured plugins
	require("plugins.preconfigured.autopairs"),
	-- require("plugins.preconfigured.bookmarks"),
	-- require("plugins.preconfigured.colorizer"),
	require("plugins.preconfigured.comment"),
	require("plugins.preconfigured.format"),
	require("plugins.preconfigured.git"),
	require("plugins.preconfigured.tagbar"),
	require("plugins.preconfigured.lspconfig"),
	require("plugins.preconfigured.markdown"),
	require("plugins.preconfigured.neotree"),
	-- completion engine, coq and cmp are not compatible
	require("plugins.preconfigured.coq"),
	-- require "plugins.preconfigured.nvim-cmp"
	-- require("plugins.preconfigured.rust"),
	require("plugins.preconfigured.telescope"),
}
