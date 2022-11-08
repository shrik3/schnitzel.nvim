call plug#begin('~/.vim/plugged')

" Apparance
Plug 'rafi/awesome-vim-colorschemes'


Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'lervag/vimtex', {'fox':'tex'}

" deplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'zchee/deoplete-clang'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'deoplete-plugins/deoplete-lsp'
" Plug 'deoplete-plugins/deoplete-jedi', {'for':'python'}
" Plug 'rzaluska/deoplete-rtags'
" Plug 'tweekmonster/deoplete-clang2'
" Plug 'lighttiger2505/deoplete-vim-lsp'

call plug#end()

" deoplete conf
source  ~/.config/nvim/deoplete_conf.vim

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


