local M = {
	"akinsho/toggleterm.nvim",
}

M.config = function()
	require("toggleterm").setup({
		-- size can be a number or function which is passed the current terminal
		open_mapping = [[<c-\>]],
		autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
		start_in_insert = true,
		insert_mappings = true, -- whether or not the open mapping applies in insert mode
		terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
		persist_size = true,
		persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
		direction = "float",
		auto_scroll = true, -- automatically scroll to the bottom on terminal output
		-- This field is only relevant if direction is set to 'float'

		-- toggleterm
		vim.cmd([[
        " set
        autocmd TermEnter term://*toggleterm#*
        \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>

        " By applying the mappings this way you can pass a count to your
        " mapping to open a specific window.
        " For example: 2<C-t> will open terminal 2
        nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
        inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>
        ]]),
	})
end

return M
