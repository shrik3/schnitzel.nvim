
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
source ~/.config/nvim/neovide.vim

" -- UI...----------------------------------------------
" -- ---------------------------------------------------
" temp (only for testing ... will be removed)
colorscheme tokyonight
" better split bar
highlight VertSplit guibg=NONE
highlight VertSplit ctermbg=NONE

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

" Avoid garbled characters in Chinese language windows OS
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Hacky stuffs ======================================
" https://vim.fandom.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
" change the behavior of the <Enter> key when the popup menu is visible. In that
" case the Enter key will simply select the highlighted menu item, just as <C-Y>
" does. &&
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" ignore some files in menu
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif
