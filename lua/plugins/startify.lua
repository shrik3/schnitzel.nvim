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

let g:startify_bookmarks = [ '~/docs/WHK/',
                            \'~/.config/nvim/',
                            \'~/tracker.txt',
                            \'~/notes',
                            \'~/Vocabulary.txt',
                          \]

let g:startify_custom_header = [
            \'  ||    / ____| |  | |  __ \|_   _| |/ /___ \    ||',
            \'  ||   | (___ | |__| | |__) | | | | / /  __) |   ||',
            \'__||__  \___ \|  __  |  _  /  | | |  <  |__ <  __||_',
            \'--..--  ____) | |  | | | \ \ _| |_| . \ ___) | --..--',
            \'  ||   |_____/|_|  |_|_|  \_\_____|_|\_\____/    ||',
            \'-----------------------------------------------------'
            \]

]])
end

return M
