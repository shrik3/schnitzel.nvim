require("lspsaga").setup({
    -- NOTE: the keymaps are defined in lspconfig.lua, because these keymaps 
    -- should only work when a language serve is attached. 
    -- (using nvim-lspconfig's on_attach). Also, not all lsp functionalities are
    -- provided by lspSaga, I would like to put all these keymaps in the same place.
    
    -- LSP Finder (gh)
    finder = {
        --percentage
        max_height = 0.5,
        keys = {
            jump_to = 'p',
            edit = { 'o', '<CR>' },
            vsplit = 's',
            split = 'i',
            tabe = 't',
            quit = { 'q', '<ESC>' },
            close_in_preview = '<ESC>'
        },
    },

    -- Peek definition (gd)
    -- This is broken, waiting for upstream to fix.
    definition = {
        edit = "<C-c>o",
        vsplit = "<C-c>v",
        split = "<C-c>i",
        tabe = "<C-c>t",
        quit = "q",
        close = "<Esc>",
    }

})
