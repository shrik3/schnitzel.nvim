local M = {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
	},
	lazy = false,
}

M.config = function()
	local cmp = require("cmp")
	vim.opt.completeopt = { "menu", "menuone", "noselect" }

	local keymap = vim.api.nvim_set_keymap
	local opts = { noremap = true, silent = true }
	keymap("i", "<C-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
	keymap("s", "<C-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
	keymap("i", "<C-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
	keymap("s", "<C-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
	-- Set up nvim-cmp.
	local has_words_before = function()
		unpack = unpack or table.unpack
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	end
	local cmp = require("cmp")
	local luasnip = require("luasnip")
	require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })
	cmp.setup({
		window = {
			completion = {
				border = "rounded",
				winhighlight = "Normal:CmpNormal",
			},
			-- documentation = cmp.config.window.bordered(),
		},

		mapping = cmp.mapping.preset.insert({

			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				elseif has_words_before() then
					cmp.complete()
				else
					fallback()
				end
			end, { "i", "s" }),

			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),

			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-e>"] = cmp.mapping.abort(),
			-- Accept currently selected item. Set `select` to `false` to only
			-- confirm explicitly selected items.
			["<CR>"] = cmp.mapping.confirm({ select = false }),
		}),
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "buffer" },
			{ name = "path" },
		}),
	})

    -- it breaks visual selection. Disable for now
	-- cmp.setup.cmdline(":", {
	-- 	mapping = cmp.mapping.preset.cmdline(),
	-- 	sources = cmp.config.sources({
	-- 		{ name = "path" },
	-- 		{ name = "cmdline" },
	-- 	}),
	-- })
end

return M
