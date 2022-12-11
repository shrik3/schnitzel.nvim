" -- LUA !----------------------------------------------
" -- ---------------------------------------------------
lua << EOF
    require"init"
EOF

" -- Legacy Plugins(managed by vim Plug)----------------
" -- ---------------------------------------------------
source ~/.config/nvim/legacy/plugins.vim

" -- Custom Scripts(that are tricky in lua)-------------
" -- ---------------------------------------------------
source ~/.config/nvim/legacy/scripts.vim
if exists("g:neovide")
    source ~/.config/nvim/neovide.vim
endif
" -- UI...----------------------------------------------
" -- ---------------------------------------------------
" temp (only for testing ... will be removed)
colorscheme vision
" -- Custom Scripts(one liners)-------------------------
" -- ---------------------------------------------------

" custom syntax for proverif
au BufRead,BufNewFile *.pv setfiletype proverif

" filetype auto commands
au FileType markdown set tw=80
au FileType text set tw=80
au FileType latex set tw=80

" return to last edit pos.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
au FocusGained,BufEnter * checktime

" :W sudo saves the file 
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

