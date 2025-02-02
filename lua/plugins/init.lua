return {
    -- colorscheme
	"shrik3/dagon",
    -- no trailing white spaces
	"ntpeters/vim-better-whitespace",
    -- better word motion (press w)
	"chaoren/vim-wordmotion",
	-- programming

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
    -- completion engine
	require("plugins.preconfigured.nvim-cmp"),
    -- all in one searching UI
	require("plugins.preconfigured.telescope"),
    -- auto session management
	require("plugins.preconfigured.persistence"),

	-- inactive

    -- making plain text tables
	-- "godlygeek/tabular",

    -- language: hare
	-- { name = "hare.vim", url = "https://git.sr.ht/~sircmpwn/hare.vim" },

    -- language: aspect C++
	-- "shrik3/vim-aspectcpp",

    -- language: arm64 assembly
	-- "compnerd/arm64asm-vim",

    -- language: rust
	-- require("plugins.preconfigured.rust"),

    -- "paste" image from clipboard
	-- require("plugins.preconfigured.paste-image"),

    -- auto closing brackets ... do you really need it?
	-- require("plugins.preconfigured.autopairs"),

    -- well. I tried it and it feels more bloat than convenient.
	-- require("plugins.preconfigured.surround"),

    -- show css hex colors
	-- require("plugins.preconfigured.colorizer"),
}
