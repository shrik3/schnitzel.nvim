" -- LUA Load the main lua config-----------------------
" -- ---------------------------------------------------
lua << EOF
    require"init"
EOF

" -- Custom Scripts(that are tricky in lua)-------------
" -- ---------------------------------------------------
source ~/.config/nvim/legacy/scripts.vim

if exists("g:neovide")
    source ~/.config/nvim/neovide.vim
endif

" -- Custom Scripts(one liners)-------------------------
" -- ---------------------------------------------------

" return to last edit pos.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
au FocusGained,BufEnter * checktime

" -- Filetype perks ...........-------------------------
" -- ---------------------------------------------------
" custom syntax for proverif
au FileType markdown,text,latex set tw=80
au FileType nasm,c,cpp          set tw=80
au FileType mail                set tw=80
au FileType python              set tw=120
au FileType java                set tw=400
" set cindent for c/cpp, this overrides smartindent (si)
au FileType c,cpp               set cindent
" expand tab by default, but force noet for some..
" force tab indentation for some languages
au FileType make                            set noet
au FileType nasm,ld,asm,c,cpp,python,rust   set noet
" tab is 8 spaces for c, per kernel code style
au FileType c                               set ts=8
au FileType c                               set shiftwidth=8
au BufRead,BufNewFile *.pv                  set ft=proverif
au BufEnter *.h                             set ft=c
