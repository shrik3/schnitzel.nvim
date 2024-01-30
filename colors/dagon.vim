"" based on:
"" https://github.com/ryanpcmcquen/true-monochrome_vim

hi clear
if version > 580
  if exists("syntax_on")
    syntax reset
  endif
endif

"" give it a name and set the background

""
"" now, on to the good stuff! TODO
""
"" cterm        hex
"" 46           #00d56d

set background=dark

" The basic
hi Normal          guifg=#00d56d    guibg=#000000    ctermfg=46       ctermbg=black    gui=NONE         cterm=NONE

"" Special items
hi Cursor          guifg=#000000    guibg=#00d56d    ctermfg=black    ctermbg=white    gui=NONE         cterm=NONE
hi IncSearch       guifg=#000000    guibg=#00d56d    ctermfg=black    ctermbg=white    gui=ITALIC       cterm=NONE
hi Search          guifg=#000000    guibg=#00d56d    ctermfg=black    ctermbg=white    gui=ITALIC       cterm=NONE
hi Visual          guifg=#000000    guibg=#00d56d    ctermfg=black    ctermbg=white    gui=ITALIC       cterm=NONE
hi VisualNOS       guifg=#000000    guibg=#00d56d    ctermfg=black    ctermbg=white    gui=ITALIC       cterm=NONE
hi CursorLine                       guibg=#000033                                      gui=NONE                   
hi CursorColumn    guifg=#00d56d    guibg=#000033    ctermfg=grey     ctermbg=white    gui=NONE         cterm=NONE
hi ColorColumn                      guibg=#000033                     ctermbg=darkblue
hi LineNr          guifg=#666666    guibg=#000000    ctermfg=grey     ctermbg=black    gui=NONE         cterm=NONE
hi Todo            guifg=#000000    guibg=#00d56d    ctermfg=black    ctermbg=46       gui=BOLD         cterm=BOLD
hi Pmenu           guifg=#00d56d                     ctermfg=white    ctermbg=black    gui=BOLD         cterm=BOLD
hi PmenuSbar       guifg=#A0A0A0                     ctermfg=grey                      gui=NONE         cterm=NONE
hi PmenuSel        guifg=#A0A0A0                     ctermfg=grey                      gui=ITALIC       cterm=NONE
hi PmenuThumb      guifg=#A0A0A0                     ctermfg=grey                      gui=NONE         cterm=NONE

"" highlighting ... 
hi Label           guifg=#FFFFFF                     ctermfg=white                     gui=NONE         cterm=NONE
hi PreProc         guifg=#FFFFFF                     ctermfg=white                     gui=NONE         cterm=NONE
hi Operator        guifg=#00d56d                     ctermfg=46                        gui=NONE         cterm=NONE
hi Comment         guifg=#888888                     ctermfg=grey                      gui=ITALIC       cterm=NONE
hi Folded          guifg=#888888                     ctermfg=grey                      gui=NONE         cterm=NONE
hi DiffChange      guifg=#FFFFFF                     ctermfg=grey                      gui=NONE         cterm=NONE
hi DiffDelete      guifg=#ff0000                     ctermfg=grey                      gui=NONE         cterm=NONE
hi DiffText        guifg=#00d56d                     ctermfg=46                        gui=NONE         cterm=NONE
hi DiffAdd         guifg=#00d56d    guibg=#000000    ctermfg=white                     gui=NONE         cterm=NONE
hi Repeat          guifg=#FFFF00                     ctermfg=yellow                    gui=BOLD         cterm=BOLD
hi Conditional     guifg=#FFFF00                     ctermfg=yellow                    gui=BOLD         cterm=BOLD
hi Statement       guifg=#00d56d                     ctermfg=grey                      gui=BOLD         cterm=BOLD
hi Function        guifg=#00d56d                     ctermfg=grey                      gui=NONE         cterm=NONE
hi Declarator      guifg=#ffffff                     ctermfg=grey                      gui=NONE         cterm=NONE
hi Error           guifg=#ff0000    guibg=#000000    ctermfg=red     ctermbg=black     gui=UNDERLINE    cterm=UNDERLINE
hi MatchParen      guifg=#FFFF00                     ctermfg=grey                      gui=UNDERLINE    cterm=UNDERLINE
hi Structure       guifg=#00d56d                     ctermfg=grey                      gui=BOLD         cterm=BOLD
hi Identifier      guifg=#A0A0A0                     ctermfg=grey                      gui=NONE         cterm=NONE
hi Directory       guifg=#A0A0A0                     ctermfg=grey                      gui=NONE         cterm=NONE
hi Ignore          guifg=#A0A0A0                     ctermfg=grey                      gui=NONE         cterm=NONE
hi ModeMsg         guifg=#A0A0A0                     ctermfg=grey                      gui=NONE         cterm=NONE
hi MoreMsg         guifg=#A0A0A0                     ctermfg=grey                      gui=NONE         cterm=NONE
hi NonText         guifg=#A0A0A0                     ctermfg=grey                      gui=NONE         cterm=NONE
hi Special         guifg=#00ffff                     ctermfg=cyan                      gui=NONE         cterm=NONE
hi SpecialKey      guifg=#00ffff                     ctermfg=cyan                      gui=ITALIC       cterm=NONE
hi StatusLine      guifg=#A0A0A0                     ctermfg=grey                      gui=BOLD         cterm=BOLD
hi StatusLineNC    guifg=#A0A0A0                     ctermfg=grey                      gui=ITALIC       cterm=NONE
hi TabLine         guifg=#A0A0A0                     ctermfg=grey                      gui=NONE         cterm=NONE
hi TabLineFill     guifg=#A0A0A0                     ctermfg=grey                      gui=NONE         cterm=NONE
hi TabLineSel      guifg=#A0A0A0                     ctermfg=grey                      gui=BOLD         cterm=BOLD
hi Title           guifg=#A0A0A0                     ctermfg=grey                      gui=NONE         cterm=NONE
hi TypeDef         guifg=#A0A0A0                     ctermfg=grey                      gui=BOLD         cterm=BOLD
hi Underlined      guifg=#A0A0A0                     ctermfg=grey                      gui=UNDERLINE    cterm=UNDERLINE
hi VertSplit       guifg=#A0A0A0                     ctermfg=grey                      gui=NONE         cterm=NONE
hi WarningMsg      guifg=#A0A0A0                     ctermfg=grey                      gui=NONE         cterm=NONE
hi WildMenu        guifg=#A0A0A0                     ctermfg=grey                      gui=NONE         cterm=NONE
hi cucumberTags    guifg=#A0A0A0                     ctermfg=grey                      gui=BOLD         cterm=BOLD
hi htmlTagN        guifg=#A0A0A0                     ctermfg=grey                      gui=BOLD         cterm=BOLD
hi rubySymbol      guifg=#A0A0A0                     ctermfg=grey                      gui=NONE         cterm=NONE

"" white fg w/black bg
hi StorageClass    guifg=#00d56d                     ctermfg=white                     gui=BOLD         cterm=BOLD
hi Type            guifg=#00d56d                     ctermfg=white                     gui=NONE         cterm=NONE
hi Constant        guifg=#00d56d                     ctermfg=white                     gui=NONE         cterm=NONE
hi Number          guifg=#FFFFFF                     ctermfg=white                     gui=NONE         cterm=NONE
hi String          guifg=#AAAA00                     ctermfg=white                     gui=ITALIC       cterm=ITALIC
