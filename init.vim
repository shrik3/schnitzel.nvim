" -- LUA Load the main lua config-----------------------
" -- ---------------------------------------------------
lua << EOF
    require"init"
EOF

" -- Legacy Plugins(managed by vim Plug)----------------
" -- ---------------------------------------------------
" if you want to use a vim script based plugin manager
" e.g. vim-Plug, uncomment the following line and add
" your plugin configs there.
" source ~/.config/nvim/legacy/plugins.vim

" -- Custom Scripts(that are tricky in lua)-------------
" -- ---------------------------------------------------
source ~/.config/nvim/legacy/scripts.vim


" -- UI...----------------------------------------------
" -- ---------------------------------------------------
" -- you can safely remove this if you don't use neovide
if exists("g:neovide")
    source ~/.config/nvim/neovide.vim
endif

" -- Custom Scripts(one liners)-------------------------
" -- ---------------------------------------------------

" custom syntax for proverif
au BufRead,BufNewFile *.pv setfiletype proverif

autocmd BufNew,BufRead *.asm set ft=nasm
autocmd BufNew,BufRead *.s set ft=nasm
autocmd BufNew,BufRead *.S set ft=asm

" filetype auto commands
au FileType markdown set tw=80
au FileType text set tw=80
au FileType latex set tw=80
" use tab indentation for some languages
au FileType nasm,ld,asm,c,cpp,python,rust set noet

" return to last edit pos.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
au FocusGained,BufEnter * checktime

" :W sudo saves the file 
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

