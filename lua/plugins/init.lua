return {
	-- colorscheme
	"shrik3/dagon",
	-- no trailing white spaces
	"ntpeters/vim-better-whitespace",
	"godlygeek/tabular",
	-- better word motion (press w)
	"chaoren/vim-wordmotion",

	-- preconfigured
    -- toggle code / comment
	require("plugins.preconfigured.comment"),
	-- auto code formatting
	require("plugins.preconfigured.format"),
	-- git integration (GitSigns)
	require("plugins.preconfigured.git"),
	-- ctag integration
	require("plugins.preconfigured.tagbar"),
	-- language servers
	require("plugins.preconfigured.lspconfig"),
	-- markdown preview and helpers
	require("plugins.preconfigured.markdown"),
	-- file tree navigator
	require("plugins.preconfigured.neotree"),
	-- language: rust
	require("plugins.preconfigured.rust"),
	-- completion engine
	require("plugins.preconfigured.nvim-cmp"),
	-- all in one searching UI
	require("plugins.preconfigured.telescope"),
	-- auto session management
	require("plugins.preconfigured.persistence"),
	require("plugins.preconfigured.autopairs"),
	require("plugins.preconfigured.bookmarks"),
	require("plugins.preconfigured.colorizer"),
	require("plugins.preconfigured.latex"),

	-- inactive
	-- completion engine, coq and cmp are not compatible
	-- require("plugins.preconfigured.coq"),

	-- well. I tried it and it feels more bloat than convenient.
	-- require("plugins.preconfigured.surround"),
}
