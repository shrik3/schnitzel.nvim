local snips = {
    "evesdropper/luasnip-latex-snippets.nvim",
	dependencies = { "L3MON4D3/LuaSnip",},
}

local M = {
	'lervag/vimtex',
    ft = { "tex", "bib" },
}

M.config = function()
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_quickfix_mode = 1
    vim.g.tex_conceal = ""
    -- the default item indent is stupid
    vim.g.tex_indent_items = 0
end

return {snips, M}
