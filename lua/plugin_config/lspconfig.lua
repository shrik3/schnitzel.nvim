-- Config and mappings for LSP related plugins
-- currently nvim-lspconfig and lspSaga
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      local opts = {buffer = true}
      vim.keymap.set(mode, lhs, rhs, opts)
    end
   
    -- LSP SAGA
    bufmap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

    -- Displays hover information about the symbol under the cursor
    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
    
    bufmap("n","<leader>o", "<cmd>Lspsaga outline<CR>",{ silent = true })

    -- Show line diagnostics
    bufmap("n", "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })

    -- Show cursor diagnostic
    bufmap("n", "gl", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })
    -- Lists all the implementations for the symbol under the cursor
    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')

    -- Jump to the definition
    -- bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
    bufmap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
    bufmap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

    -- Jump to declaration
    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')


    -- Jumps to the definition of the type symbol
    bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')

    -- Lists all the references 
    -- replaced by Lspsaga lsp_finder
    -- bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')

    -- Displays a function's signature information
    -- replaced by Lspsaga hover_doc
    -- bufmap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

    -- Renames all references to the symbol under the cursor
    -- bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
    bufmap("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })
    bufmap("n", "<F2>", "<cmd>Lspsaga rename<CR>", { silent = true })

    -- Selects a code action available at the current cursor position
    -- bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    -- bufmap('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')
    bufmap({"n","v"}, "<F4>", "<cmd>Lspsaga code_action<CR>", { silent = true })
    bufmap({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
    

    -- Show diagnostics in a floating window
    bufmap('n', 'gL', '<cmd>lua vim.diagnostic.setloclist()<cr>')

    -- Move to the previous diagnostic
    bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')

    -- Move to the next diagnostic
    bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
  end
})


-- Set up lspconfig.
-- rust_analyzer is configured by rust_tools, don't add it here!
-- local servers = { 'clangd', 'pyright', 'texlab' , 'rust_analyzer'}
local servers = { 'clangd', 'pyright', 'texlab'}
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

