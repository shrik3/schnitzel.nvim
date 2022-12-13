vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    
    -- utilities for lots of stuffs...
    use 'nvim-lua/plenary.nvim'
   
-- +----------------------------------------------------------+
-- |                  UI                                      |
-- +----------------------------------------------------------+
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
    
    -- terminal (toggle with <C-T>)
    use "akinsho/toggleterm.nvim"
    require 'plugin_config.toggleterm'

    -- start screen
    use 'mhinz/vim-startify'
    require 'plugin_config.startify'

    -- Looks
    use 'shrik3/vision.nvim'
 
    -- as the name suggests, scroll available color themes
    use 'vim-scripts/ScrollColors'
    
    -- lightline replacement
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    require 'plugin_config.lualine'

    -- bufferline replacement
    use {'akinsho/bufferline.nvim', 
            tag = "v3.*", 
            requires = 'nvim-tree/nvim-web-devicons'
        }
    require("bufferline").setup{}
    
    -- tarbar shows a bar of tags
    use 'majutsushi/tagbar'
    vim.keymap.set('n', '<F8>', ':TagbarToggle<CR>')

-- +----------------------------------------------------------+
-- |                  EDITING AND FUNCTIONALITIES             |
-- +----------------------------------------------------------+
    -- for ... tabs..
    use 'godlygeek/tabular'
    -- don't exit vim upon closing the last buffer
    use 'rbgrouleff/bclose.vim'
    -- completes the brackets
    use 'LunarWatcher/auto-pairs'
    -- displays color for HEX color code
    use 'ap/vim-css-color'

    --- telescope fzf
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    require 'plugin_config/telescope'



-- +----------------------------------------------------------+
-- |                  MISC                                    |
-- +----------------------------------------------------------+
    -- session manager:
    use 'Shatur/neovim-session-manager'
    require 'plugin_config.neovim-session-manager'
    
    -- manage marks, but this plugin kinda suffers from bugs, 
    -- disable for noe
    -- use 'chentoast/marks.nvim'
    -- require 'plugin_config.marks'

    -- measures the startup time for optimization
    use 'tweekmonster/startuptime.vim'
    -- wakatime for statistics, need to initialize token for fresh install
    use 'wakatime/vim-wakatime'

-- +----------------------------------------------------------+
-- |                  COMPLETION                              |
-- +----------------------------------------------------------+
    -- deoplete XXXX
    -- use 'deoplete-plugins/deoplete-tag'
    -- use {'deathlyfrantic/deoplete-spell', branch = 'main'}
    -- Deoplete relatives
    -- use 'Shougo/neco-syntax'
    -- use 'Shougo/context_filetype.vim'
    
    -- nvim-cmp family
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    require 'plugin_config.nvim-cmp' -- configs for nvim-cmp
    -- end nvim-cmp family

-- +----------------------------------------------------------+
-- |                  PROGRAMMING                             |
-- +----------------------------------------------------------+
    
    -- LSP
    use 'neovim/nvim-lspconfig'
    require 'plugin_config.lspconfig'
    -- lspSaga provides better UI for the LSP.
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
    
    -- treesitter does the tree sitting, 
    -- e.g. provides (static) linting, better highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
    require 'plugin_config.nvim-treesitter'

    -- Rust Lang : these two replace lsoconfig's native support for rust..
    use 'simrat39/rust-tools.nvim'
    require 'plugin_config.rust-tools'
    -- Rust Lang Debugging
    use 'mfussenegger/nvim-dap'
    
    -- AspectC++ highlighting
    use 'shrik3/vim-aspectcpp'

    -- general auto formatting
    use 'Chiel92/vim-autoformat'
    vim.keymap.set('n', '<F3>', ':Autoformat<CR>')
    -- yet another one
    use 'rhysd/vim-clang-format'

    -- Toggle comments, replacement for nerdCommenter
    -- But I don't like it TODO find a better one
    use 'terrortylor/nvim-comment'
    require 'plugin_config.nvim-comment'

    -- git
    use 'airblade/vim-gitgutter'
    
    -- latex / markdown
    -- well latex and markdown are not 'programming'
    -- but let them just sit here..
    -- vimtex
    use 'lervag/vimtex'
    vim.g.vimtex_view_general_viewer = 'zathura'
    vim.g.vimtex_quickfix_mode=1
    vim.g.tex_conceal = ""
    -- the default item indent is stupid
    vim.g.tex_indent_items=0

    -- latex preview...
    use {
        'xuhdev/vim-latex-live-preview',
        ft = {'tex'},
    }
    vim.g.livepreview_previewer = 'zathura'
    vim.g.livepreview_use_biber = 1
    
    -- vim-markdown , for markdown editing--
    use 'plasticboy/vim-markdown'
    vim.g.vim_markdown_math = 1
    vim.g.vim_markdown_folding_disabled = 1
    vim.g.vim_markdown_auto_insert_bullets = 0

    -- Note: markdown preview is managed by vim-Plug
    --
    -- install without yarn or npm
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
        ft = { "markdown" },
    })
    require 'plugin_config.markdown-preview'

end)

-- additional configs for nvim-cmp related..
--
--
--

