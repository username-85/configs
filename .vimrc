call plug#begin('~/.vim/plugged')
    Plug 'airblade/vim-gitgutter' , { 'commit': '44dbd57d' }
    Plug 'easymotion/vim-easymotion', { 'commit': 'b3cfab2a' }
    Plug 'junegunn/fzf.vim', { 'commit': 'c5ce7908' }
    Plug 'junegunn/vim-easy-align' , { 'commit': '9815a55d' }
    Plug 'ntpeters/vim-better-whitespace', { 'commit': '86a0579b' }
    Plug 'majutsushi/tagbar', { 'commit': 'd55d454b' }
    Plug 'tpope/vim-fugitive', { 'commit': 'd4877e54' }
    Plug 'farmergreg/vim-lastplace', { 'commit': 'e58cb0df' }
"    Plug 'vifm/vifm.vim', { 'commit': 'b1fe33e5' }
    Plug 'kshenoy/vim-signature', { 'commit': '6bc3dd12' }
    Plug 'milkypostman/vim-togglelist', { 'commit': '48f0d302' }
    Plug 'will133/vim-dirdiff', { 'commit': '84bc8999' }
    Plug 'justinmk/vim-dirvish', { 'commit': '2ddd8ee6'}
call plug#end()

" --- blinking cursor start
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
" --- blinking cursor end

set sessionoptions=buffers
" for gitgutter also
set updatetime=200
"set statusline+=%F
set fillchars=vert:\│
set nowrapscan
set nofixendofline
set ttyfast
"https://github.com/vim/vim/issues/2790
"set re=0
"set redrawtime=10000
set lazyredraw
"se nostartofline
"set tags=./tags,tags;
let mapleader = "\<Space>"
"let mapleader = " "
"let mapleader = ","
" reload changed files
filetype plugin on
set autoread

set foldmethod=manual
set nofoldenable
set switchbuf=uselast
set complete=.,w,b,u,t
set timeoutlen=500
set ttimeoutlen=100
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
set cm=blowfish2
set viminfo="NONE"
set nobackup
set noswapfile
set nowritebackup
"turn it off, because it's also affects ctags case search
"set ignorecase
set wildmode=list:longest,full
set wildmenu
set synmaxcol=4000
set colorcolumn=90
set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,cp1251,cp866,koi8-r
set noautochdir
set wrap
set linebreak
set hidden
set splitright
set splitbelow

"search
set hlsearch
set incsearch
nnoremap <silent><leader>, :nohlsearch<CR>

" forcing unix file format to always see dos/windows linebreaks (^M)
" new lines would be added without it
set ff=unix
set ffs=unix

"colors
"set t_Co=16
syntax on
colorscheme user_green

"indent
set cin
set autoindent
set copyindent
set preserveindent
set smarttab
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
"set noexpandtab
set expandtab
filetype indent off
set cino=(shiftwidth

set listchars=tab:>·,trail:·

" disable some syntax highlighting
autocmd FileType markdown setlocal syntax=off

command Spell setlocal spell! spelllang=ru,en

" status line only if 2 windows
set laststatus=1

au FileType gitcommit setlocal tw=90

"----- keys -----

inoremap jj <Esc>
inoremap оо <Esc>

" disable ex mode
map Q <Nop>

noremap tt :tab split<CR>
"nnoremap Q <nop>
"map q <Nop>
imap <F1> <Nop>
nmap <F1> <Nop>
nnoremap <F1> :Spell <CR>
nnoremap <F2> :set list! <bar> :ToggleWhitespace <CR>
nnoremap <F3> :Dirvish <CR>
nnoremap <F4> :GitGutterQuickFix<CR>
nnoremap <F11> :BTags!<CR>
nnoremap <F12> :TagbarToggle<CR>

nnoremap <leader>b :Buffers<CR>
nnoremap <leader>l :BLines<CR>
nnoremap <leader>L :Lines!<CR>

" switch to prev buffer
nnoremap <C-w><Space> <C-^>

" switch layout in insert mode
inoremap <C-l> <C-^>

" switch to prev window
noremap <C-w>; <C-w>p

" Switch to last-active tab
if !exists('g:Lasttab')
    let g:Lasttab = 1
    let g:Lasttab_backup = 1
endif
autocmd! TabLeave * let g:Lasttab_backup = g:Lasttab | let g:Lasttab = tabpagenr()
autocmd! TabClosed * let g:Lasttab = g:Lasttab_backup
nmap <silent> <C-w><Tab> :exe "tabn " . g:Lasttab<cr>

" copy to clipboard
vmap <leader>y "+ygv"zy`>

" save
inoremap <C-s> <C-o>:wa<CR>
noremap <C-s> :wa<CR>

" grep
set grepprg=rg\ --vimgrep
nnoremap <silent> <leader>r :Rg! <C-R>=expand("<cword>")<CR><CR>

"------ plugins settings ------

" dirvish
" sort folders at the top
let g:dirvish_mode = ':sort ,^.*[\/],'

" fugitive
let g:fugitive_no_maps = 1

"tagbar
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
"let g:tagbar_show_data_type = 1
let g:tagbar_iconchars = ['+', '-']
"let g:tagbar_autoshowtag = 1

" cscope and ctags
set csprg=gtags-cscope
set cscopetag
" if set to 0 cscopequickfix settings are applied
set csto=1
silent! cs add GTAGS
nmap <silent><leader>g <C-]>
"nmap <silent><leader>g :silent! tag <C-R>=expand("<cword>")<CR><CR> <bar> :silent! ltag <CR>
nmap <silent><leader>c :lcs find c <C-R>=expand("<cword>")<CR><CR>
nmap <silent><leader>a :lcs find a <C-R>=expand("<cword>")<CR><CR>
nmap <silent><leader>s :lcs find s <C-R>=expand("<cword>")<CR><CR>
nmap <silent><leader>t :lcs find t "<C-R>=expand("<cword>")"<CR><CR>
nmap <silent><leader>f :lcs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <silent><leader>i :lcs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <silent><leader>e :lcs find e <C-R>=expand("<cword>")<CR><CR>
set cscopequickfix=g-,c-,a-,s-,t-,f-,i-,a-,e-
"set cscopequickfix=s-,t-,e-,i-

" disable plugin
let loaded_netrwPlugin = 0

" easy - align
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
let g:easy_align_delimiters = {
\ '-': { 'pattern': '-', 'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0, 'ignore_groups':   [] },
\ '+': { 'pattern': '+', 'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0, 'ignore_groups':   [] },
\ ':': { 'pattern': ':', 'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0, 'ignore_groups':   [] },
\ }

" redefine Rg for fzf to pass arguments and follow symlinks
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg -L --column --line-number --no-heading --color=always --smart-case '.(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('right:60%', 'ctrl-/')
  \           : fzf#vim#with_preview('right:60%', 'ctrl-/'),
  \   <bang>0)

" whitespace handling
let g:better_whitespace_enabled=0
let g:strip_whitespace_on_save=1
let g:strip_only_modified_lines=1
let g:strip_whitespace_confirm=0

let g:fzf_vim = {}
"let g:fzf_preview_window = []
let g:fzf_preview_window = ['right:60%:hidden', 'ctrl-/']
" Use location list instead of quickfix list
let g:fzf_vim.listproc = { list -> fzf#vim#listproc#location(list) }
" [Tags] Command to generate tags file
let g:fzf_vim.tags_command = 'ctags -R'

nmap <leader>j :lne<CR>
nmap <leader>k :lp<CR>
" TODO: change it later
nmap <leader>n :cn<CR>
nmap <leader>p :cp<CR>

" gitgutter
let g:gitgutter_map_keys = 0
let g:gitgutter_preview_win_floating = 0
let g:gitgutter_use_location_list = 1
nmap <C-@>v <Plug>(GitGutterPreviewHunk)
nmap <C-@>j <Plug>(GitGutterNextHunk)
nmap <C-@>k <Plug>(GitGutterPrevHunk)
nmap <C-@>s <Plug>(GitGutterStageHunk)
nmap <C-@>u <Plug>(GitGutterUndoHunk)

" signature
let g:SignatureMarkTextHLDynamic = 1
let g:SignatureMap = {
    \ 'Leader'             :  "m",
    \ 'PlaceNextMark'      :  "",
    \ 'ToggleMarkAtLine'   :  "m.",
    \ 'PurgeMarksAtLine'   :  "m-",
    \ 'DeleteMark'         :  "",
    \ 'PurgeMarks'         :  "",
    \ 'PurgeMarkers'       :  "m<BS>",
    \ 'GotoNextLineAlpha'  :  "",
    \ 'GotoPrevLineAlpha'  :  "",
    \ 'GotoNextSpotAlpha'  :  "",
    \ 'GotoPrevSpotAlpha'  :  "",
    \ 'GotoNextLineByPos'  :  "",
    \ 'GotoPrevLineByPos'  :  "",
    \ 'GotoNextSpotByPos'  :  "",
    \ 'GotoPrevSpotByPos'  :  "",
    \ 'GotoNextMarker'     :  "",
    \ 'GotoPrevMarker'     :  "",
    \ 'GotoNextMarkerAny'  :  "",
    \ 'GotoPrevMarkerAny'  :  "",
    \ 'ListBufferMarks'    :  "m/",
    \ 'ListBufferMarkers'  :  "m?"
    \ }

let g:toggle_list_no_mappings=0
nmap <script> <silent> <C-@>l :call ToggleLocationList()<CR>
nmap <script> <silent> <C-@>q :call ToggleQuickfixList()<CR>
