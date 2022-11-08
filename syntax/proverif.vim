" Vim syntax file for proverif's .pv files.
"
" author: smelC
" creation: December 2015
"
" To use this :
" 1/ copy this file to ~/.vim/syntax/
" 2/ copy this into your .vimrc:
"      set t_Co=256 " (if your terminal does not support 256 colors, install ncurses-term on ubuntu)
"      au BufRead,BufNewFile *.pv setfiletype proverif

if exists("b:current_syntax")
	finish
endif

syntax keyword proverifKeywords among channel choice clauses const def elimtrue else equation equivalence event expand fail forall free fun get if in insert let letfun new noninterf not nounif or otherwise out param phase pred proba process proof putbegin query reduc set suchthat table then type weaksecret yield
syntax keyword proverifTypes bitstring bool
syntax keyword proverifValues true false
syntax match proverifOperators "!"
syntax match proverifOperators "|"
syntax match proverifOperators "==>"
syntax match proverifOperators "<>"
syntax match proverifOperators "&&"
syntax match proverifOperators "||"
syntax keyword proverifQualifiers data private typeConverter

syntax region proverifInjEvent start="inj-"  end="event" 
syntax region proverifComment start="(\*"  end="\*)" 

highlight def link proverifComment Comment

" general format:
" highlight Statement   term=bold      cterm=NONE ctermfg=white     ctermbg=NONE   " gui=bold       guifg=#ffff60    guibg=NONE
highlight proverifKeywordsColor cterm=bold ctermfg=1
highlight proverifTypesColor cterm=NONE ctermfg=2
highlight proverifValuesColor cterm=NONE ctermfg=3
highlight proverifOperatorsColor cterm=NONE ctermfg=6
highlight proverifQualifiersColor cterm=NONE ctermfg=5

" link the (left) element with its color (right)
highlight def link proverifKeywords Keyword
highlight def link proverifInjEvent Keyword
highlight def link proverifTypes Type
highlight def link proverifValues proverifValuesColor
highlight def link proverifOperators Operator
highlight def link proverifQualifiers proverifQualifiersColor

let b:current_syntax = "proverif"
