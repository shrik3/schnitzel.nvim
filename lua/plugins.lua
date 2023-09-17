-- auto-install packer if none-exist.
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    
    -- utilities for lots of stuffs...
    use 'nvim-lua/plenary.nvim'
   
-- +----------------------------------------------------------+
-- |                  UI                                      |
-- +----------------------------------------------------------+
--
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
    use {
        "akinsho/toggleterm.nvim",
        config = [[require'plugin_config.toggleterm']]
    }

    -- start screen
    use {
        'mhinz/vim-startify',
        config = [[require 'plugin_config.startify']]
    }

    -- Looks
    use {
        'shrik3/alabaster.nvim',
    }
 
    -- as the name suggests, scroll available color themes
    use 'vim-scripts/ScrollColors'
    
    -- lightline replacement
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      config = [[require'plugin_config.lualine']]
    }

    -- bufferline replacement
    use {
        'akinsho/bufferline.nvim', 
        tag = "v3.*", 
        requires = 'nvim-tree/nvim-web-devicons',
        config = function() require('bufferline').setup() end
    }
    
    -- tarbar shows a bar of tags
    use{
        'majutsushi/tagbar',
        config = function() 
            vim.keymap.set('n', '<F8>', ':TagbarToggle<CR>')
        end
    } 


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

    -- replaces lspsaga
    use {
        "gbrlsnchs/telescope-lsp-handlers.nvim"
    } 

    --- telescope fzf
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = { {'nvim-lua/plenary.nvim'} },
      config = [[require('plugin_config/telescope')]]
    }

    -- split VeryLongWords for easier w nav
    use 'chaoren/vim-wordmotion'
    -- undo tree  
    use {
        'mbbill/undotree',
        config = function()
            vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
        end
    }
-- +----------------------------------------------------------+
-- |                  MISC                                    |
-- +----------------------------------------------------------+
    -- session manager:
    use {
        'Shatur/neovim-session-manager',
        config = [[require('plugin_config.neovim-session-manager')]]
    }
    
    -- measures the startup time for optimization
    use 'tweekmonster/startuptime.vim'

-- +----------------------------------------------------------+
-- |                  COMPLETION                              |
-- +----------------------------------------------------------+
    -- nvim-cmp family
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
            'hrsh7th/cmp-nvim-lsp',
            'onsails/lspkind.nvim',
            { 'hrsh7th/cmp-nvim-lsp-signature-help', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
            { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
            'lukas-reineke/cmp-under-comparator',
            { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp-document-symbol', after = 'nvim-cmp' },
        },
        config = [[require('plugin_config.nvim-cmp')]],
        event = 'InsertEnter',
        wants = 'LuaSnip',
    }

-- +----------------------------------------------------------+
-- |                  PROGRAMMING                             |
-- +----------------------------------------------------------+
    
    -- LSP
    use {
        'neovim/nvim-lspconfig',
        config=[[require'plugin_config.lspconfig']]
    }
    


    -- lsp status on the status line
    use 'arkav/lualine-lsp-progress'
    
    -- Rust Lang : these two replace lsoconfig's native support for rust..
    -- Rust Lang Debugging
    use {
        'simrat39/rust-tools.nvim',
        config = [[require'plugin_config.rust-tools']]
    }

    -- AspectC++ highlighting
    use 'shrik3/vim-aspectcpp'

    -- general auto formatting
    use 'Chiel92/vim-autoformat'
    vim.keymap.set('n', '<F3>', ':Autoformat<CR>')
    -- yet another one
    use 'rhysd/vim-clang-format'

    use {
        'numToStr/Comment.nvim',
        config = [[require'plugin_config.comment']]
    }

    -- git
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }

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
    vim.g.livepreview_previewer = 'okular'
    vim.g.livepreview_use_biber = 1

    -- vim-markdown , for markdown editing--
    use 'plasticboy/vim-markdown'
    vim.g.vim_markdown_math = 1
    vim.g.vim_markdown_folding_disabled = 1
    vim.g.vim_markdown_auto_insert_bullets = 0

    -- install without yarn or npm
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
        ft = { "markdown" },
        config = [[require'plugin_config.markdown-preview']]
    })

    ---- MISC----------------------
    -- Which-key , trying..
    use {
        'folke/which-key.nvim',
        config = function()
            require('which-key').setup {}
        end,
        event = 'BufReadPost',
    }

    -- sync plugins for fresh setup
    if is_bootstrap then
        require('packer').sync()
    end
end)


-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
    print '=================================='
    print '    Plugins are being installed'
    print '    Wait until Packer completes,'
    print '       then restart nvim'
    print '=================================='
    return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
    command = 'source <afile> | PackerCompile',
    group = packer_group,
    pattern = vim.fn.expand '$MYVIMRC',
})

