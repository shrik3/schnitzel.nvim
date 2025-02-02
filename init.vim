" -- main config in lua. -------------------------------
" -- ---------------------------------------------------
lua << EOF
    require"init"
EOF

"" you should config neovide in its own config directory instead of here.
"" e.g. ~/.config/neovide
if exists("g:neovide")
    source ~/.config/nvim/archived/neovide.vim
endif

"" hacky user scripts
source ~/.config/nvim/scripts.vim

" return to last edit pos.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
au FocusGained,BufEnter * checktime

" -- Filetype perks ...........-------------------------
" -- ---------------------------------------------------
au BufEnter *.h                 setl ft=c
" line widths
au FileType markdown,text,latex setl tw=80
au FileType tex                 setl tw=80
au FileType nasm,c,cpp          setl tw=80
au FileType mail                setl tw=72
au FileType rust                setl tw=80
au FileType python              setl tw=120
au FileType java                setl tw=400
" expand tab by default, but force noet for some..
au FileType cmake               set et
au FileType markdown            set et
au FileType make                set noet
au FileType rust                set noet
au FileType nasm,ld,asm         set noet
au FileType c,cpp,python        set noet
au FileType rust                set ts=4
" tab is 8 spaces for c, per kernel code style
au FileType rust                setl ts=4
au FileType c,asm,nasm          setl ts=8 | setl shiftwidth=8

" set cindent for c/cpp, this overrides smartindent (si)
au FileType c,cpp               setl cin
" let plaintext be plaintext:
au FileType text,markdown,mail,gitcommit    setl nosi | set noai

" other perks
au BufRead,BufNewFile *.pv      setl ft=proverif
