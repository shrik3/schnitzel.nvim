call plug#begin('~/.vim/plugged')

" Apparance
" Plug 'rafi/awesome-vim-colorschemes'
Plug 'shrik3/tokyonight.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'lervag/vimtex', {'fox':'tex'}

" deplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'deoplete-plugins/deoplete-lsp'
Plug 'shrik3/vim-aspectcpp'

call plug#end()

" deoplete conf
source  ~/.config/nvim/legacy/plugin_config/deoplete.vim

" temp
colorscheme tokyonight

" vim-markdown:
let g:tex_conceal = ""
" the default item indent is stupid
let g:tex_indent_items=0

let g:vim_markdown_math = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_auto_insert_bullets = 0


" Vim-live LAtex
let g:livepreview_previewer = 'zathura'
let g:livepreview_use_biber = 1


" vim-markdown-preview
let g:mkdp_open_to_the_world = 1
let g:mkdp_browser = 'vimb'
let g:mkdp_open_ip = '127.0.0.1'
let g:mkdp_port = 6789
let g:mkdp_browser = 'vimb'
let g:mkdp_refresh_slow = 1
let g:mkdp_preview_options = {
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


"" Startify, package is managed by Packer, but configed in vimscript
"" show startify when closing the last buffer
" autocmd BufEnter * if line2byte('.') == -1 && len(tabpagebuflist()) == 1 | Startify | endif
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

let g:startify_bookmarks = [ '~/docs/WHK/',
                            \'~/.config/nvim/',
                          \]

let g:startify_custom_header = [
            \'                                                     ',
            \'  __     _____ _    _ _____  _____ _  ______     __  ',
            \'  ||    / ____| |  | |  __ \|_   _| |/ /___ \    ||  ',
            \'  ||   | (___ | |__| | |__) | | | | / /  __) |   ||  ',
            \'__||__  \___ \|  __  |  _  /  | | |  <  |__ <  __||__',
            \'--..--  ____) | |  | | | \ \ _| |_| . \ ___) | --..--',
            \'  ||   |_____/|_|  |_|_|  \_\_____|_|\_\____/    ||  ',
            \'                                                     ',
            \'-----------------------------------------------------'
            \]

