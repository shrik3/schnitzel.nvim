local M = {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
}

M.config = function()
	vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
	vim.keymap.set("n", "<F10>", ":Neotree buffers float toggle<CR>")
	vim.keymap.set("n", "<leader>bb", ":Neotree buffers toggle<CR>")
	vim.keymap.set("n", "<F9>", ":Neotree toggle<CR>")
	vim.keymap.set("n", "<leader>tt", ":Neotree float toggle<CR>")
	vim.keymap.set("n", "<leader>tg", ":Neotree git_status float toggle<CR>")
	require("neo-tree").setup({})
end

return M
