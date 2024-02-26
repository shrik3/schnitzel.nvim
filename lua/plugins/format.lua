local M = {
	"mhartington/formatter.nvim",
}

-- https://github.com/mhartington/formatter.nvim/tree/master/lua/formatter/filetypes
M.config = function()
	local util = require("formatter.util")
	local defaults = require("formatter.defaults")
	local ft = require("formatter.filetypes")

	-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
	require("formatter").setup({
		-- Enable or disable logging
		logging = true,
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
			-- python = ft.python, -- fuck, who decides to use space indent on python?
			sh = ft.sh.shfmt,
			lua = ft.lua.stylua,
            tex = ft.tex.latexindent,
			-- Use the special "*" filetype for defining formatter configurations on
			-- any filetype
			["*"] = {
				-- "formatter.filetypes.any" defines default configurations for any
				-- filetype
				require("formatter.filetypes.any").remove_trailing_whitespace,
			},
		},
	})
end

return M
