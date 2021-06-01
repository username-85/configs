set background=dark
let g:colors_name="user_green"
"hi clear
"if exists("syntax on")
"    syntax reset
"endif

"let g:color_name="greenish"
" Normal colors  --- 
" 8 - dark grey
" 2 -dark green
" 3 -dark yellow
" 4 -dark blue
" 1 - dark red
" 0 - black
" 6 - dark cyan
" 7 -grey
" 
"grey fg
hi Normal		ctermfg=7 ctermbg=0 
hi MatchParen	ctermfg=0 ctermbg=4
hi Folded		ctermfg=7 ctermbg=0
hi FoldColumn	ctermfg=7 ctermbg=0
hi VisualNOS	ctermfg=7 ctermbg=8

"dark cyan fg
hi LineNr		ctermfg=6 ctermbg=0 
"hi LineNr		ctermfg=238 ctermbg=0 
hi Comment		ctermfg=6 ctermbg=0 
hi TablineSel	ctermfg=6 ctermbg=0

"dark red fg
hi ErrorMsg     ctermfg=1 ctermbg=0 
"hi DiffText     ctermfg=1 ctermbg=0 
hi SpellBad     ctermfg=1 ctermbg=0 
hi vimError     ctermfg=1 ctermbg=0 

"magenta 5

"black fg
hi NonText		ctermfg=4 ctermbg=0
hi WildMenu		ctermfg=3 ctermbg=0 cterm=NONE term=NONE
hi TablineFill	ctermfg=234 ctermbg=234 cterm=NONE
hi Search		ctermfg=3 ctermbg=238 cterm=NONE term=NONE guifg=NONE guibg=NONE
hi IncSearch		ctermfg=3 ctermbg=238 cterm=NONE term=NONE guifg=NONE guibg=NONE
"hi Search		ctermfg=0 ctermbg=2 cterm=NONE term=NONE guifg=NONE guibg=NONE
"hi IncSearch		ctermfg=0 ctermbg=2 cterm=NONE term=NONE guifg=NONE guibg=NONE

hi Error		ctermfg=0 ctermbg=1 cterm=NONE term=NONE guifg=NONE guibg=NONE

"tmp
hi Visual		ctermfg=7 ctermbg=238 cterm=NONE term=NONE
"hi Visual		ctermfg=0 ctermbg=4 cterm=NONE term=NONE

"blue fg
hi Tabline		ctermfg=4 ctermbg=234 cterm=NONE term=NONE guifg=NONE guibg=NONE
hi ModeMsg		ctermfg=4 ctermbg=0 
hi Include		ctermfg=4 ctermbg=0 

"green fg
hi String		ctermfg=2 ctermbg=0 
hi Keyword		ctermfg=2 ctermbg=0 
hi Type			ctermfg=2 ctermbg=0 
hi Statement	ctermfg=2 ctermbg=0 
hi Constant		ctermfg=2 ctermbg=0 
hi Identifier	ctermfg=2 ctermbg=0 
hi Operator		ctermfg=2 ctermbg=0 
hi Function		ctermfg=2 ctermbg=0 
hi SpecialKey	ctermfg=2 ctermbg=0 
hi Directory	ctermfg=2 ctermbg=0 
hi Question     ctermfg=2 ctermbg=0

"dark yellow fg
hi Title		ctermfg=3  
hi Special		ctermfg=3  
hi Define		ctermfg=3 ctermbg=0 
hi Preproc		ctermfg=3
hi Macro		ctermfg=3 ctermbg=0 


"from zenburn 
hi StatusLine		ctermfg=235   ctermbg=3
hi StatusLineNC		ctermfg=235   ctermbg=4
hi VertSplit		ctermfg=234   ctermbg=235
"hi VertSplit		ctermfg=0   ctermbg=242
hi ColorColumn		ctermbg=233   ctermfg=3
"hi MyTagListFileName ctermfg=grey
"hi TagListTagName ctermfg=2 ctermbg=0

hi Pmenu		ctermfg=6 ctermbg=234 cterm=NONE term=NONE
hi PmenuSel		ctermfg=3 ctermbg=0 cterm=NONE term=NONE
hi PmenuSbar		ctermfg=0 ctermbg=234 cterm=NONE term=NONE
hi PmenuThumb		ctermfg=0 ctermbg=6 cterm=NONE term=NONE
"PmenuSbar      
"PmenuThumb 

hi Todo         ctermfg=1 ctermbg=0 cterm=NONE term=NONE

hi Underlined term=underline cterm=underline ctermfg=12

" from zenburn
hi DiffAdd         guifg=#709080 guibg=#313c36 gui=bold       ctermfg=66  ctermbg=237 cterm=bold
hi DiffChange      guibg=#333333                              ctermbg=236
hi DiffDelete      guifg=#333333 guibg=#464646                ctermfg=236 ctermbg=238
hi DiffText        guifg=#ecbcbc guibg=#41363c gui=bold       ctermfg=217 ctermbg=237 cterm=bold

hi SignColumn      guifg=#9fafaf gui=bold                     ctermfg=109 cterm=bold
hi SignColumn    guibg=#181818                         ctermbg=233

"dif
"red
"hi DiffDelete ctermbg=52 cterm=NONE term=NONE
"blue
"hi DiffChange ctermbg=18 cterm=NONE term=NONE
"green 
"hi DiffAdd ctermbg=23 cterm=NONE term=NONE

hi MyTagListFileName ctermfg=6 ctermbg=0
