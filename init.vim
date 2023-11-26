" -- LUA Load the main lua config-----------------------
" -- ---------------------------------------------------
lua << EOF
    require"init"
EOF

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
" this command enforces:
" - at the beginning of lines, use <TAB> as identations
" - inside of the lines, use spaces for tabulation
" a handy command to retab spaces at BEGINNING of lines only
command! RetabIndents retab!|call RetabIndents()
func! RetabIndents()
    let default_tab = &expandtab
    set et
    let saved_view = winsaveview()
    execute '%s@^\(\ \{'.&ts.'\}\)\+@\=repeat("\t", len(submatch(0))/'.&ts.')@e'
    let &expandtab=default_tab
    call winrestview(saved_view)
endfunc

" return to last edit pos.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
au FocusGained,BufEnter * checktime
" :W sudo saves the file 
" this normally won't work... use sudoedit instead.
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" -- Filetype perks ...........-------------------------
" -- ---------------------------------------------------
" custom syntax for proverif
au FileType markdown,text,latex set tw=80
au FileType nasm,c,cpp          set tw=80
au FileType python              set tw=120
" this is a meme
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



