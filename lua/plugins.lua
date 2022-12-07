vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    
    -- utilities for lots of stuffs...
    use 'nvim-lua/plenary.nvim'
    
    -- neotree a file explorer/manager
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    }
    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
    vim.keymap.set('n', '<F10>', ':Neotree buffers toggle<CR>')
    vim.keymap.set('n', '<leader>bb', ':Neotree buffers toggle<CR>')
    vim.keymap.set('n', '<F9>', ':Neotree toggle<CR>')

    -- a utils package which provides mini-starter
    -- use 'echasnovski/mini.nvim'
    -- session manager:
    -- 'nvim-lua/plenary.nvim'  -- is depdencency for nsm
    use 'Shatur/neovim-session-manager'
    require 'plugin_config.neovim-session-manager'

    use 'chentoast/marks.nvim'
    require 'plugin_config.marks'

    -- start screen
    use 'mhinz/vim-startify'
    -- note that startify is not a nvim (lua) native plugin
    -- its config lies in ../legacy/plugins.vim
    -- TODO move the config 
    
    -- Looks
    -- tokyonight managed by Plugged for local testing
    -- use 'shrik3/tokyonight.nvim'

    -- as the name suggests, scroll available color themes
    use 'vim-scripts/ScrollColors'
    
    -- lightline replacement
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    require 'plugin_config.lualine'

    -- bufferline replacement
    use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
    require("bufferline").setup{}

    -- Misc
    use 'tweekmonster/startuptime.vim'
    use 'rbgrouleff/bclose.vim'
    use 'LunarWatcher/auto-pairs'
    use 'ap/vim-css-color'
    -- deoplete XXXX
    use 'deoplete-plugins/deoplete-tag'
    use {'deathlyfrantic/deoplete-spell', branch = 'main'}

    -- Deoplete relatives
    use 'Shougo/neco-syntax'
    use 'Shougo/context_filetype.vim'
    use 'mileszs/ack.vim'

    -- Ack fuzzy finder--
    vim.g.ackprg = 'ag --vimgrep'
    vim.keymap.set('n', '<leader>f', ':Ack! ')

    -- wakatime for statistics, need to initialize token for fresh install
    use 'wakatime/vim-wakatime'

    use "akinsho/toggleterm.nvim"
    require 'plugin_config.toggleterm'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            local saga = require("lspsaga")
            saga.init_lsp_saga({
                -- config
            })
        end,
    })

    require 'plugin_config.lspconfig'

    -- Programming
    -- nvim-treesitter for linting/enhanced highlighting 
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
    require 'plugin_config.nvim-treesitter'

    -- Rust Lang
    use 'simrat39/rust-tools.nvim'
    require 'plugin_config.rust-tools'
    -- Rust Lang Debugging
    use 'mfussenegger/nvim-dap'

    -- use 'metakirby5/codi.vim'
    use 'rhysd/vim-clang-format'

    use 'majutsushi/tagbar'
    vim.keymap.set('n', '<F8>', ':TagbarToggle<CR>')

    use 'terrortylor/nvim-comment'
    require 'plugin_config.nvim-comment'

    -- general auto formatting
    use 'Chiel92/vim-autoformat'
    vim.keymap.set('n', '<F3>', ':Autoformat<CR>')

    -- Haskell code formatting
    -- use {
    --     'alx741/vim-stylishask',
    --     ft = {'haskell'}
    -- }

    -- git
    use 'airblade/vim-gitgutter'

    -- latex / markdown
    use 'lervag/vimtex'
    require 'plugin_config.vimtex'

    use {
        'xuhdev/vim-latex-live-preview',
        ft = {'tex'},
    }



    -- vim-markdown , for markdown editing--
    use 'plasticboy/vim-markdown'
    vim.g.vim_markdown_math = 1
    vim.g.vim_markdown_folding_disabled = 1
    vim.g.vim_markdown_auto_insert_bullets = 0

    -- for ... tabular..
    use 'godlygeek/tabular'


end)



