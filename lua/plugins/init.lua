return {
	"shrik3/dagon",
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
	-- aarch64 assembly syntax hl
	"compnerd/arm64asm-vim",
	{
		"HakonHarnes/img-clip.nvim",
		event = "VeryLazy",
	},
}
