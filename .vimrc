call plug#begin('~/.vim/plugged')
    Plug 'airblade/vim-gitgutter'
"    Plug 'bsdelf/bufferhint'
    Plug 'easymotion/vim-easymotion'
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/vim-easy-align'
    Plug 'ntpeters/vim-better-whitespace'
"    Plug 'roxma/vim-tmux-clipboard'
"    Plug 'tmux-plugins/vim-tmux-focus-events'
    Plug 'scrooloose/nerdtree'
"    Plug 'vim-scripts/taglist.vim'
    Plug 'majutsushi/tagbar'
    Plug 'stefandtw/quickfix-reflector.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'farmergreg/vim-lastplace'
call plug#end()

" --- blinking cursor start
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
" --- blinking cursor end

" for gitgutter also
set updatetime=200
"set statusline+=%F
set fillchars=vert:\│
set nowrapscan
set nofixendofline
set ttyfast
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
set ignorecase
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

"search
set nohlsearch
set incsearch

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

set grepprg=rg\ --vimgrep

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
nnoremap <F1> :NERDTreeToggle<CR>
nnoremap <F2> :GFiles!<CR>
nnoremap <F3> :Buffers<CR>
nnoremap <F4> :Lines!<CR>

nnoremap <F5> :set list! <bar> :ToggleWhitespace <CR>
nnoremap <F6> :BCommits!<CR>

nnoremap <F9> :Tags!<CR>
nnoremap <F10> :BTags!<CR>
nnoremap <F11> :TagbarToggle<CR>

" switch to prev buffer
nnoremap <C-w><Space> <C-^>

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

"------ plugins settings and key mappings ------

"tagbar
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
"let g:tagbar_show_data_type = 1
let g:tagbar_iconchars = ['+', '-']
"let g:tagbar_autoshowtag = 1

let g:quickr_cscope_use_qf_g = 0
let g:quickr_cscope_autoload_db = 0
let g:quickr_cscope_keymaps = 0
let g:quickr_cscope_program = "gtags-cscope"
let g:quickr_cscope_db_file = "GTAGS"
let g:quickr_cscope_prompt_length = 1

noremap <Leader>w :wa<CR>

"nmap <leader>v :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
"au FileType c,cpp,h nmap <buffer> <leader>s <plug>(quickr_cscope_symbols)
nmap <leader>s <plug>(quickr_cscope_symbols)
"nmap <leader>g <plug>(quickr_cscope_global)
nmap <leader>g <C-]>
nmap <leader>c <plug>(quickr_cscope_callers)
nmap <leader>f <plug>(quickr_cscope_files)
nmap <leader>i <plug>(quickr_cscope_includes)
nmap <leader>t <plug>(quickr_cscope_text)
"nmap <leader>cd <plug>(quickr_cscope_functions)
nmap <leader>a <plug>(quickr_cscope_assignments)
"<plug>(quickr_cscope_egrep)
"<plug>(quickr_cscope_global_split)
"<plug>(quickr_cscope_global_vert_split)

" disable plugin
let loaded_netrwPlugin = 0
"let NERDTreeHijackNetrw=1

let g:NERDTreeDirArrows=0
let g:NERDTreeMinimalUI=1
let g:NERDTreeWinSize=50
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
let g:NERDTreeMapOpenVSplit="s"
let g:NERDTreeMapOpenSplit="v"
let g:NERDTreeBookmarksSort=0

" easy - align
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
let g:easy_align_delimiters = {
\ '-': { 'pattern': '-', 'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0, 'ignore_groups':   [] },
\ '+': { 'pattern': '+', 'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0, 'ignore_groups':   [] },
\ ':': { 'pattern': ':', 'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0, 'ignore_groups':   [] },
\ }

" redefine Rg for fzf to pass arguments
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

" easymotion
" search 2 symbols
" vim can't map <c-space>, using NUL instead
nnoremap <NUL> <Plug>(easymotion-bd-w)
" search 2 below

"let g:fzf_preview_window = []
let g:fzf_preview_window = ['right:60%:hidden', 'ctrl-/']

" " Copy to clipboard
vmap <leader>y "+ygv"zy`>

set csprg=gtags-cscope
set cst
silent! cs add GTAGS

nmap <leader>n :lne<CR>
nmap <leader>p :lp<CR>
" TODO: change it later
nmap <leader><DOWN> :cn<CR>
nmap <leader><UP> :cp<CR>

" gitgutter
"let g:gitgutter_map_keys = 0
let g:gitgutter_preview_win_floating = 0
nmap <leader>d <Plug>(GitGutterPreviewHunk)
"nnoremap <leader>p :SignifyHunkDiff<cr>
"nnoremap <leader>u :SignifyHunkUndo<cr>
nmap <leader>j <Plug>(GitGutterNextHunk)
nmap <leader>k <Plug>(GitGutterPrevHunk)
nmap <leader>h <Plug>(GitGutterStageHunk)
nmap <leader>u <Plug>(GitGutterUndoHunk)
