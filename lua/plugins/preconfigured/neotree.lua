local M = {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
}

M.config = function()
	vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
    -- as you can see, I need this so much that I have 3x keybindings to the
    -- same thing!
	vim.keymap.set("n", "<F10>", ":Neotree buffers toggle<CR>")
	vim.keymap.set("n", "<leader>bb", ":Neotree buffers toggle<CR>")
	vim.keymap.set("n", "<leader>tb", ":Neotree buffers toggle<CR>")
    -- the <leader><leader> mapping is for telescope because I can quickily
    -- search and grep a buffer.
	vim.keymap.set("n", "<F9>", ":Neotree toggle<CR>")
	vim.keymap.set("n", "<leader>tt", ":Neotree toggle<CR>")
	vim.keymap.set("n", "<leader>tg", ":Neotree git_status toggle<CR>")
	vim.keymap.set("n", "<F5>", ":Neotree git_status toggle<CR>")
	require("neo-tree").setup({
        -- when restoring from a session, the buffers are there but "unloaded".
        -- I want to see the mall regardless.
        buffers = {show_unloaded = true},
    })
end

return M
