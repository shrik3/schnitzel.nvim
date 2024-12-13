local M = {
	"numToStr/Comment.nvim",
}

M.config = function()
	require("Comment").setup({
		toggler = {
			line = "<leader>cc",
			block = "<leader>cb",
		},

		opleader = {
			---Line-comment keymap
			line = "<Leader>cc",
			block = "<leader>cb",
		},
	})
end

return M
