local COQ = {
	"ms-jpq/coq_nvim",
	branch = "coq",
	lazy = false,
	dependencies = {
		{ "ms-jpq/coq.thirdparty", branch = "3p" },
		-- { "ms-jpq/coq.artifacts", branch = "artifacts" },
	},
}

COQ.init = function()
	vim.g.coq_settings = {
		completion = {
			always = true,
			smart = false,
			skip_after = { " ", "(", "	", "{" },
		},
		auto_start = "shut-up",
		-- I don't want your default keymaps
		keymap = {
			recommended = false,
			jump_to_mark = "",
			bigger_preview = "",
		},
		display = {
			ghost_text = { highlight_group = "Normal" },
			icons = { mode = "none" },
		},
		clients = {
			registers = { enabled = false },
			tree_sitter = { enabled = false },
		},
	}
	vim.g.coq_settings.display = {
		ghost_text = { enabled = false },
	}
	vim.api.nvim_set_keymap("i", "<Esc>", [[pumvisible() ? "\<C-e><Esc>" : "\<Esc>"]], { expr = true, silent = true })
	vim.api.nvim_set_keymap("i", "<BS>", [[pumvisible() ? "\<C-e><BS>" : "\<BS>"]], { expr = true, silent = true })
	vim.api.nvim_set_keymap("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true, silent = true })
	vim.api.nvim_set_keymap("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<BS>"]], { expr = true, silent = true })
	vim.api.nvim_set_keymap(
		"i",
		"<CR>",
		[[pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"]],
		{ expr = true, silent = true }
	)
	-- require("coq_3p")({
	-- { src = "dap" },
	-- { src = "builtin/js" },
	-- { src = "builtin/php" },
	-- { src = "builtin/html", short_name },
	-- { src = "builtin/css" },
	-- { src = "builtin/c" },
	-- })
end

return COQ
