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
	"folke/neodev.nvim",
	-- +----------------------------------------------------------+
	-- |                  UI                                      |
	-- +----------------------------------------------------------+
	--
	-- Looks
	"shrik3/alabaster.nvim",
	-- A collection of base16 colors.
	-- would work better in pure tty
	"Soares/base16.nvim",
	-- as the name suggests, scroll available color themes
	"vim-scripts/ScrollColors",
	-- tagbar shows a bar of tags
	{
		"majutsushi/tagbar",
		config = function()
			vim.keymap.set("n", "<F8>", ":TagbarToggle<CR>")
		end,
	},

	-- +----------------------------------------------------------+
	-- |                  EDITING AND FUNCTIONALITIES             |
	-- +----------------------------------------------------------+
	"ntpeters/vim-better-whitespace",
	-- for ... tabs..
	"godlygeek/tabular",

	-- don't exit vim upon closing the last buffer
	"rbgrouleff/bclose.vim",

	-- completes the brackets
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},

	-- displays color for HEX color code
	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},

	-- split VeryLongWords for easier w nav
	"chaoren/vim-wordmotion",

	-- +----------------------------------------------------------+
	-- |                  MISC                                    |
	-- +----------------------------------------------------------+
	-- measures the startup time for optimization
	-- Replaced by lazy's builtin
	-- 'tweekmonster/startuptime.vim',

	-- +----------------------------------------------------------+
	-- |                  COMPLETION                              |
	-- +----------------------------------------------------------+
	-- see plugins/nvim-cmp

	-- +----------------------------------------------------------+
	-- |                  PROGRAMMING                             |
	-- +----------------------------------------------------------+

	{
		"mrcjkb/rustaceanvim",
		version = "^4",
		ft = { "rust" },
	},
	-- show lsp server status on lualine
	-- { "arkav/lualine-lsp-progress", dependencies = { "nvim-lualine/lualine.nvim" } },

	{
		name = "hare.vim",
		url = "https://git.sr.ht/~sircmpwn/hare.vim",
	},

	-- AspectC++ highlighting
	"shrik3/vim-aspectcpp",
	-- aarch64 assembly syntax hl
	"compnerd/arm64asm-vim",

	-- git
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
            vim.keymap.set("n", "<leader>gbl", ":Gitsigns blame_line<CR>")
		end,
	},

}
