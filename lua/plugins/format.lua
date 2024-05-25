local M = {
	"mhartington/formatter.nvim",
}

M.config = function()
	local util = require("formatter.util")
	local defaults = require("formatter.defaults")
	local ft = require("formatter.filetypes")
	require("formatter").setup({
		-- Enable or disable logging
		logging = false,
		-- Set the log level
		log_level = vim.log.levels.WARN,
		-- All formatter configurations are opt-in
		filetype = {
			rust = {
				function()
					return {
						exe = "rustfmt",
						args = { "--emit=stdout" },
						stdin = true,
					}
				end,
			},
			cpp = defaults.clangformat,
			c = defaults.clangformat,
			sh = ft.sh.shfmt,
			lua = ft.lua.stylua,
			tex = ft.tex.latexindent,
            -- default for any filetype: remove trailing spaces
			["*"] = {
				require("formatter.filetypes.any").remove_trailing_whitespace,
			},
		},
	})
end

return M
