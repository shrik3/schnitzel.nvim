local M = {
	"neovim/nvim-lspconfig",
}

M.config = function()
	-- Config and mappings for LSP related plugins
	-- currently nvim-lspconfig and lspSaga
	-- See `:help vim.diagnostic.*` for documentation on any of the below functions
	local opts = { noremap = true, silent = true }
	-- Use an on_attach function to only map the following keys
	-- after the language server attaches to the current buffer
	vim.api.nvim_create_autocmd("LspAttach", {
		desc = "LSP actions",
		callback = function()
			local bufmap = function(mode, lhs, rhs)
				local opts = { buffer = true }
				vim.keymap.set(mode, lhs, rhs, opts)
			end

			-- Use telescope extension for LSP
			bufmap("n", "<leader>gh", "<cmd>lua vim.lsp.buf.references()<cr>")
			-- Displays hover information about the symbol under the cursor
			bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")
			-- Lists all the implementations for the symbol under the cursor
			bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
			-- Jump to declaration
			bufmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
			-- Jump to defs
			bufmap("n", "gd", "<cmd> lua vim.lsp.buf.definition()<cr>")
			-- Jumps to the definition of the type symbol
			bufmap("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
			-- Show diagnostics in a floating window
			bufmap("n", "gL", "<cmd>lua vim.diagnostic.setloclist()<cr>")
			-- Move to the previous diagnostic
			bufmap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
			-- Move to the next diagnostic
			bufmap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")

			bufmap("n", "<leader>gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
			bufmap({ "n", "v" }, "<F4>", "<cmd>lua vim.lsp.buf.code_action()<CR>", { silent = true })
			bufmap({ "n", "v" }, "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { silent = true })
			bufmap("n", "<F2>", "<cmd> lua vim.lsp.buf.rename()<CR>", { silent = true })
		end,
	})

	-- setup neoconf before LSPs.
	require("neoconf").setup({})

	-- Set up lspconfig.
	local servers = { "jedi_language_server", "texlab", "cmake", "bashls", "gopls" }
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
	for _, lsp in ipairs(servers) do
		require("lspconfig")[lsp].setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end
end

return M
