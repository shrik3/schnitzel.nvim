call plug#begin('~/.vim/plugged')

" Apparance
Plug 'shrik3/tokyonight.nvim'
Plug 'shrik3/vision.nvim'

" Markdown preview: the init. is kinda tricky and doesn't work well with Packer.
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Plug 'lervag/vimtex', {'fox':'tex'}

" deplete (also partially managed by Packer)
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'
" Plug 'deoplete-plugins/deoplete-lsp'


call plug#end()

" deoplete conf
" source  ~/.config/nvim/legacy/plugin_config/deoplete.vim


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

