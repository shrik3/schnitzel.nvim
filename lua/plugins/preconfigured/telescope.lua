--- telescope fzf
local M = {
	"nvim-telescope/telescope.nvim",
	branch = "master",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"gbrlsnchs/telescope-lsp-handlers.nvim",
	},
}

M.config = function()
	local builtin = require("telescope.builtin")
	-- https://vimawesome.com/plugin/telescope-nvim
	require("telescope").setup({
		defaults = {}, -- Your defaults config goes in here
		pickers = {
			-- Your special builtin config goes in here
			buffers = {
				sort_lastused = true,
				theme = "ivy",
				previewer = false,
				mappings = {
					i = {
						["<c-d>"] = require("telescope.actions").delete_buffer,
						-- Right hand side can also be the name of the action as a string
						["<c-d>"] = "delete_buffer",
					},
					n = {
						["<c-d>"] = require("telescope.actions").delete_buffer,
					},
				},
			},
			find_files = { theme = "ivy" },
			live_grep = { theme = "ivy" },
		},
		extensions = {}, -- Your extension config goes in here
	})

	require("telescope").load_extension("lsp_handlers") -- TODO find a better place for this

	vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "find files" })
	vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "live grep" })
	vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find existing buffers" })
	vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "help tags" })
	vim.keymap.set("n", "<leader>ft", builtin.tags, { desc = "seach tags" })
	vim.keymap.set("n", "<leader>?", builtin.oldfiles, { desc = "[?] Find recently opened files" })
	vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
end

return M
