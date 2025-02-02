-- Lua
return {
	"folke/persistence.nvim",
	-- this is a bug.
	event = "BufReadPre", -- this will only start session saving when an actual file was opened
	opts = {
		-- add any custom options here
		-- directory where session files are saved
		dir = vim.fn.expand("$HOME/a/proj/sessions/vim/"),
		-- minimum number of file buffers that need to be open to save
		-- Set to 0 to always save
		need = 1,
		branch = true, -- use git branch to save session
	},
}
