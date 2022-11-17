vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    }

    -- Looks
    use 'vim-scripts/ScrollColors'
    use 'itchyny/lightline.vim'
    use 'bling/vim-bufferline'
    use 'folke/tokyonight.nvim'

    -- Misc
    use 'tweekmonster/startuptime.vim'
    use 'rbgrouleff/bclose.vim'
    use 'LunarWatcher/auto-pairs'
    use 'ap/vim-css-color'
    use 'mileszs/ack.vim'
    use 'wakatime/vim-wakatime'
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end}

    -- LSP
    use 'neovim/nvim-lspconfig'

    -- Programming
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
    -- Rust Lang
    use 'simrat39/rust-tools.nvim'
    -- Rust Lang Debugging
    use 'nvim-lua/plenary.nvim'
    use 'mfussenegger/nvim-dap'

    -- use 'metakirby5/codi.vim'
    use 'rhysd/vim-clang-format'
    use 'majutsushi/tagbar'
    -- use 'preservim/nerdcommenter'
    use 'terrortylor/nvim-comment'
    use 'Chiel92/vim-autoformat'
    -- use {
    --     'lyuts/vim-rtags',
    --     ft = {'c','c++','cpp'},
    -- }
    use {
        'alx741/vim-stylishask',
        ft = {'haskell'}
    }
    use 'airblade/vim-gitgutter'

    -- latex / markdown
    use {
        'lervag/vimtex',
    }
    use {
        'xuhdev/vim-latex-live-preview',
        ft = {'tex'},
    }

    -- deoplete XXXX
    use 'deoplete-plugins/deoplete-tag'
    use {'deathlyfrantic/deoplete-spell', branch = 'main'}
    -- Deoplete relatives
    use 'Shougo/neco-syntax'
    use 'Shougo/context_filetype.vim'


    -- use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
    use 'plasticboy/vim-markdown'

    -- Editing
    use 'godlygeek/tabular'

    -- Plugin Keybindings --
    vim.keymap.set('n', '<F10>', ':Neotree buffers toggle<CR>')
    vim.keymap.set('n', '<leader>bb', ':Neotree buffers toggle<CR>')
    vim.keymap.set('n', '<F9>', ':Neotree toggle<CR>')
    -- F7 for terminal
    vim.keymap.set('n', '<F8>', ':TagbarToggle<CR>')
    vim.keymap.set('n', '<F3>', ':Autoformat<CR>')

    -- vim-rtags --
    -- vim.g.rtagsUseDefaultMappings = 0
    -- vim.cmd([[source  ~/.config/nvim/vim-rtags-mappings.vim]])

    -- Ack --
    vim.g.ackprg = 'ag --vimgrep'
    vim.keymap.set('n', '<leader>f', ':Ack! ')

    -- Vimtex --
    vim.g.vimtex_view_general_viewer = 'zathura'
    vim.g.vimtex_quickfix_mode=1

    -- Lightline --
    vim.cmd([[source ~/.config/nvim/lightline_conf.vim]])


    -- Bufferline --
    vim.g.bufferline_echo = 0
    vim.g.python3_host_prog='/usr/bin/python'

    -- nvim-comment --
    require('nvim_comment').setup({
        -- Linters prefer comment and line to have a space in between markers
        marker_padding = true,
        -- should comment out empty or whitespace only lines
        comment_empty = true,
        -- trim empty comment whitespace
        comment_empty_trim_whitespace = true,
        -- Should key mappings be created
        create_mappings = true,
        -- Normal mode mapping left hand side
        line_mapping = "<leader>cc",
        -- Visual/Operator mapping left hand side
        operator_mapping = "<leader>c",
        -- text object mapping, comment chunk,,
        comment_chunk_text_object = "ic",
        -- Hook function to call before commenting takes place
        hook = nil
    })

    -- NerdCommenter --
    -- vim.g.NERDSpaceDelims = 1
    -- vim.g.NERDDefaultAlign = 'left'
    -- vim.g.NERDCustomDelimiters = "{ 'c': { 'left': '/*','right': '*/' } }"
    -- vim.g.NERDCustomDelimiters = "{ 'cpp': { 'left': '/*','right': '*/' } }"
    -- vim.g.NERDCustomDelimiters = "{ 'proverif': { 'left': '(*','right': '*)' } }"

    -- toggleterm
    vim.cmd[[
        " set
        autocmd TermEnter term://*toggleterm#*
              \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>

        " By applying the mappings this way you can pass a count to your
        " mapping to open a specific window.
        " For example: 2<C-t> will open terminal 2
        nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
        inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>
    ]]

    -- vimtex --
    vim.g.tex_conceal = ""
    vim.g.tex_indent_items=0

    -- vim-markdown --
    vim.g.vim_markdown_math = 1
    vim.g.vim_markdown_folding_disabled = 1
    vim.g.vim_markdown_auto_insert_bullets = 0

    -- vim-markdown-preview --
    vim.g.mkdp_open_to_the_world = 1
    vim.g.mkdp_browser = 'firefox'
    vim.g.mkdp_open_ip = '127.0.0.1'
    vim.g.mkdp_port = 6789
    vim.g.mkdp_browser = 'firefox'
    vim.g.mkdp_refresh_slow = 0
    vim.g.mkdp_preview_options = [[
    {
        \ 'mkit': {},
        \ 'katex': {},
        \ 'uml': {},
        \ 'maid': {},
        \ 'disable_sync_scroll': 1,
        \ 'sync_scroll_type': 'middle',
        \ 'hide_yaml_meta': 1,
        \ 'sequence_diagrams': {},
        \ 'flowchart_diagrams': {},
        \ 'content_editable': v:false,
        \ 'disable_filename': 0
        \ }
        ]]

    end)



