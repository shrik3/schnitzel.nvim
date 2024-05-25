noremap <Leader>j :call rtags#JumpTo(g:SAME_WINDOW)<CR>
noremap <Leader>J :call rtags#JumpTo(g:SAME_WINDOW, { '--declaration-only' : '' })<CR><CR>
noremap <Leader>b :call rtags#JumpBack()<CR>
noremap <Leader>D :call rtags#Diagnostics()<CR>
noremap <Leader>rw :call rtags#RenameSymbolUnderCursor()<CR>
" noremap <Leader>S :call rtags#JumpTo(g:H_SPLIT)<CR>
noremap <Leader>d :call rtags#JumpTo(g:V_SPLIT)<CR>
noremap <Leader>rT :call rtags#JumpTo(g:NEW_TAB)<CR>
noremap <Leader>rp :call rtags#JumpToParent()<CR>
noremap <Leader>rf :call rtags#FindRefs()<CR>
noremap <Leader>rF :call rtags#FindRefsCallTree()<CR>
noremap <Leader>rn :call rtags#FindRefsByName(input("Pattern? ", "", "customlist,rtags#CompleteSymbols"))<CR>
noremap <Leader>rs :call rtags#FindSymbols(input("Pattern? ", "", "customlist,rtags#CompleteSymbols"))<CR>
noremap <Leader>rr :call rtags#ReindexFile()<CR>
noremap <Leader>rl :call rtags#ProjectList()<CR>
noremap <Leader>rv :call rtags#FindVirtuals()<CR>
noremap <Leader>rh :call rtags#ShowHierarchy()<CR>
noremap <Leader>rC :call rtags#FindSuperClasses()<CR>
noremap <Leader>rc :call rtags#FindSubClasses()<CR>
noremap <Leader>ri :call rtags#SymbolInfo()<CR>
