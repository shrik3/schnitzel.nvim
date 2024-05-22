-- start screen
local M = {
	"mhinz/vim-startify",
}

M.config = function()
	vim.cmd([[

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


let g:startify_custom_header = [
\'',
\' Powered by Schnitzel.nvim',
\' As the old saying goes -- "What the Schnitzel???"',
\' Do not forget to check the cheatsheet !',
\'-----------------------------------------------------',
\'-----------------------------------------------------'
\]

]])
end

return M
