return {
	"majutsushi/tagbar",
	config = function()
		vim.keymap.set("n", "<F8>", ":TagbarToggle<CR>")
	end,
}
