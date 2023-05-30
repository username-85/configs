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
hi MatchParen	ctermfg=229 ctermbg=237
hi Folded		ctermfg=4 ctermbg=233
hi FoldColumn	ctermfg=4 ctermbg=233
hi VisualNOS	ctermfg=7 ctermbg=8

"dark cyan fg
hi Comment		ctermfg=6 ctermbg=0
hi TablineSel	ctermfg=6 ctermbg=0

"dark red fg
hi ErrorMsg     ctermfg=1 ctermbg=0 
"hi DiffText     ctermfg=1 ctermbg=0 
hi SpellBad     ctermfg=1 ctermbg=0 
hi vimError     ctermfg=1 ctermbg=0 

"magenta 5

hi QuickFixLine ctermfg=3 ctermbg=236
"black fg
hi WildMenu		ctermfg=3 ctermbg=0 cterm=NONE term=NONE
hi TablineFill	ctermfg=234 ctermbg=234 cterm=NONE
hi Search		ctermfg=3 ctermbg=238 cterm=NONE term=NONE guifg=NONE guibg=NONE
hi IncSearch		ctermfg=3 ctermbg=238 cterm=NONE term=NONE guifg=NONE guibg=NONE
"hi Search		ctermfg=0 ctermbg=2 cterm=NONE term=NONE guifg=NONE guibg=NONE
"hi IncSearch		ctermfg=0 ctermbg=2 cterm=NONE term=NONE guifg=NONE guibg=NONE

hi Error        ctermfg=167 ctermbg=236

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

hi SpellCap     ctermfg=5 ctermbg=0

"from zenburn 
hi StatusLine	    ctermfg=234   ctermbg=3
hi StatusLineNC		ctermfg=235   ctermbg=4
hi VertSplit		ctermfg=234   ctermbg=235
"hi VertSplit		ctermfg=0   ctermbg=242
hi ColorColumn		ctermbg=233   ctermfg=3
"hi MyTagListFileName ctermfg=grey
"hi TagListTagName ctermfg=2 ctermbg=0

hi Pmenu		ctermfg=251 ctermbg=235 cterm=NONE term=NONE
hi PmenuSel		ctermfg=187 ctermbg=236 cterm=NONE term=NONE
hi PmenuSbar		ctermfg=0 ctermbg=234 cterm=NONE term=NONE
hi PmenuThumb		ctermfg=0 ctermbg=6 cterm=NONE term=NONE
"PmenuSbar      
"PmenuThumb 

hi Todo         ctermfg=1 ctermbg=0 cterm=NONE term=NONE

hi Underlined term=underline cterm=underline ctermfg=12

hi DiffAdd         ctermfg=2 ctermbg=234
hi DiffChange      ctermfg=6 ctermbg=234
hi DiffDelete      ctermfg=1 ctermbg=234
hi DiffText        ctermfg=3 ctermbg=234

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
hi LineNr		ctermfg=245 ctermbg=0
hi NonText		ctermfg=238 ctermbg=0

au Syntax c,cpp syn keyword cType u64 u32 u16 u8
au Syntax c,cpp syn keyword cType i64 i32 i16 i8
au BufNewFile,BufRead Jenkinsfile setf groovy
