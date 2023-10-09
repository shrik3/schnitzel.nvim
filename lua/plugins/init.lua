return {
    "folke/which-key.nvim",
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    "folke/neodev.nvim", 
-- +----------------------------------------------------------+
-- |                  UI                                      |
-- +----------------------------------------------------------+
--
    -- Looks
    'shrik3/alabaster.nvim',
    
    -- A collection of base16 colors.
    -- would work better in pure tty
    'Soares/base16.nvim',
 
    -- as the name suggests, scroll available color themes
    'vim-scripts/ScrollColors',
    
    -- tarbar shows a bar of tags
    {
        'majutsushi/tagbar',
        config = function() 
            vim.keymap.set('n', '<F8>', ':TagbarToggle<CR>')
        end
    } ,

-- +----------------------------------------------------------+
-- |                  EDITING AND FUNCTIONALITIES             |
-- +----------------------------------------------------------+
    -- for ... tabs..
    'godlygeek/tabular',
    -- don't exit vim upon closing the last buffer
    'rbgrouleff/bclose.vim',
    -- completes the brackets
    'LunarWatcher/auto-pairs',
    -- displays color for HEX color code
    -- 'ap/vim-css-color',
    -- css-color replaced by nvim-colorizer
    {
        'NvChad/nvim-colorizer.lua',
        config = function()
        require 'colorizer'.setup()
    end
    },
    -- split VeryLongWords for easier w nav
    'chaoren/vim-wordmotion',
    -- undo tree  
    {
        'mbbill/undotree',
        config = function()
            vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
        end
    },
-- +----------------------------------------------------------+
-- |                  MISC                                    |
-- +----------------------------------------------------------+
    -- measures the startup time for optimization
    -- Replaced by lazy's builtin
    -- 'tweekmonster/startuptime.vim',

-- +----------------------------------------------------------+
-- |                  COMPLETION                              |
-- +----------------------------------------------------------+
    -- see plugins/nvim-cmp

-- +----------------------------------------------------------+
-- |                  PROGRAMMING                             |
-- +----------------------------------------------------------+
    
    -- show lsp server status on lualine
    {'arkav/lualine-lsp-progress', dependencies = {'nvim-lualine/lualine.nvim'}},

    -- AspectC++ highlighting
    'shrik3/vim-aspectcpp',

    -- general auto formatting
    'Chiel92/vim-autoformat',
    -- vim.keymap.set('n', '<F3>', ':Autoformat<CR>')
    -- yet another one
    'rhysd/vim-clang-format',

    -- git
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    },

    ---- MISC----------------------
}