return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},
	{ "folke/neoconf.nvim", cmd = "Neoconf" },
	{ "echasnovski/mini.tabline", config = { show_icons = false } },
	"shrik3/alabaster.nvim",
	-- "vim-scripts/ScrollColors",
	-- tagbar shows a bar of tags
	{
		"majutsushi/tagbar",
		config = function()
			vim.keymap.set("n", "<F8>", ":TagbarToggle<CR>")
		end,
	},
	"ntpeters/vim-better-whitespace",
	-- for ... tabs..
	"godlygeek/tabular",
	-- don't exit vim upon closing the last buffer
	"rbgrouleff/bclose.vim",
	-- completes the brackets
	{ "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
	-- displays color for HEX color code
	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	-- split VeryLongWords for easier w nav
	"chaoren/vim-wordmotion",
	{ name = "hare.vim", url = "https://git.sr.ht/~sircmpwn/hare.vim" },
	-- AspectC++ highlighting
	"shrik3/vim-aspectcpp",
	-- aarch64 assembly syntax hl
	"compnerd/arm64asm-vim",
}
