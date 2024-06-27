" -- LUA Load the main lua config-----------------------
" -- ---------------------------------------------------
lua << EOF
    require"init"
EOF

if exists("g:neovide")
    source ~/.config/nvim/neovide.vim
endif

" -- Custom Scripts(one liners)-------------------------
" -- ---------------------------------------------------
map <A-Tab> :call SwitchBuffer() <CR>
map <S-Tab> :call SwitchBufferP() <CR>
function! SwitchBuffer()
    :set showtabline=2
    :bn
endfunction

function! SwitchBufferP()
    :set showtabline=2
    :bp
endfunction

" a better retab functoin
:command! -nargs=1 -range SuperRetab <line1>,<line2>s/\v%(^ *)@<= {<args>}/\t/g

" return to last edit pos.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
au FocusGained,BufEnter * checktime

" -- Filetype perks ...........-------------------------
" -- ---------------------------------------------------
" custom syntax for proverif
au FileType markdown,text,latex set tw=80
au FileType tex                 set tw=80
au FileType nasm,c,cpp          set tw=80
au FileType mail                set tw=72
au FileType rust                set tw=80
au FileType python              set tw=120
au FileType java                set tw=400
" set cindent for c/cpp, this overrides smartindent (si)
au FileType c,cpp               set cindent
" expand tab by default, but force noet for some..
au FileType make                set noet
au FileType rust                set noet
au FileType nasm,ld,asm         set noet
au FileType c,cpp,python        set noet
au FileType rust                set ts=4
" tab is 8 spaces for c, per kernel code style
au FileType c,asm,nasm          set ts=8
au FileType c                   set shiftwidth=8
au BufRead,BufNewFile *.pv      set ft=proverif
au BufEnter *.h                 set ft=c
