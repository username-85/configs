call plug#begin('~/.config/nvim/plugged')
"    Plug 'mhinz/vim-signify'
    Plug 'airblade/vim-gitgutter'
    Plug 'bsdelf/bufferhint'
    Plug 'easymotion/vim-easymotion'
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/vim-easy-align'
"    Plug 'lyokha/vim-xkbswitch'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'ronakg/quickr-cscope.vim'
    Plug 'roxma/vim-tmux-clipboard'
    Plug 'scrooloose/nerdtree'
"    Plug 'vim-scripts/taglist.vim'
    Plug 'majutsushi/tagbar'
    Plug 'stefandtw/quickfix-reflector.vim'
    Plug 'tpope/vim-fugitive'
call plug#end()

" for gitgutter also
set updatetime=200
"set statusline+=%F
set enc=utf-8
set fillchars=vert:\│
set nowrapscan
set nofixendofline
set ttyfast
set lazyredraw
"se nostartofline
let mapleader = "\<Space>"
" reload changed files
filetype plugin on
set autoread

set foldmethod=manual
set nofoldenable
"set foldmethod=syntax
"set foldnestmax=1
"nnoremap z<space> zA

set switchbuf=useopen,usetab
set complete=.,w,b,u,t
set timeoutlen=500
set ttimeoutlen=100
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
set viminfo="NONE"
set nobackup
set noswapfile
set nowritebackup
set ignorecase
set smartcase
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
set t_Co=16
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

au Syntax c,cpp syn keyword cType uint ubyte ulong boolean_t
au Syntax c,cpp syn keyword cType int64_t int32_t int16_t int8_t
au Syntax c,cpp syn keyword cType uint64_t uint32_t uint16_t uint8_t
au Syntax c,cpp syn keyword cType u_int64_t u_int32_t u_int16_t u_int8_t

set listchars=tab:>·,trail:·

" build help tags for manually installed plugins
"helptag ~/.vim/doc/

"----- keys -----

noremap tt :tab split<CR>
"nnoremap Q <nop>
"map q <Nop>
imap <F1> <Nop>
nmap <F1> <Nop>
map <F2> :wall<CR>
"au FileType c,cpp,h,python nmap <F2> :wall<CR> :!gtags -i<CR>:silent! cs add GTAGS<CR>:cs reset<CR><CR>h
"au BufEnter *.h,*py nmap <F2> :wall<CR> :!gtags -i<CR>:silent! cs add GTAGS<CR>:cs reset<CR><CR>h

"switch layout
"inoremap <C-@> <C-^>
"noremap <C-@> <C-^>
"cmap <C-@> <C-^>

"switch to previous buffer
nnoremap <F3> <C-^>

"select buffer
nnoremap <F4> :Buffers<CR>
nnoremap <C-w>a :Buffers<CR>
nnoremap <F5> :call bufferhint#Popup()<CR>
"let g:bufferhint_SortMode = 1

" tagbar
au FileType c,cpp,h,python nmap <F11> :TagbarToggle<CR>
au BufEnter *.h,*py nmap <F11> :TagbarToggle<CR>
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
"let g:tagbar_show_data_type = 1
let g:tagbar_iconchars = ['+', '-']
"let g:tagbar_autoshowtag = 1

set pastetoggle=<F12>

" remap changing forux window
noremap <C-w>; <C-w>p

nmap <F10> :set list! <bar> :ToggleWhitespace <CR>
imap <F10> <Esc> :set list! <bar> :ToggleWhitespace <CR>

nmap <F1> :NERDTreeToggle  <CR>
imap <F1> <Esc> :NERDTreeToggle <CR>

" Switch to last-active tab
if !exists('g:Lasttab')
    let g:Lasttab = 1
    let g:Lasttab_backup = 1
endif
autocmd! TabLeave * let g:Lasttab_backup = g:Lasttab | let g:Lasttab = tabpagenr()
autocmd! TabClosed * let g:Lasttab = g:Lasttab_backup
nmap <silent> <C-w><Space> :exe "tabn " . g:Lasttab<cr>

"------ disable syntax highlighting ------

" turn of syntax highlight for some files
" autocmd BufRead,BufNewFile {*.markdown,*.mdown,*.mkdn,*.md,*.mkd,*.mdwn,*.mdtxt,*.mdtext,*.text} set filetype=markdown
autocmd FileType markdown setlocal syntax=off

"------ functions ------

" Save current view settings on a per-window, per-buffer basis.
function! AutoSaveWinView()
    if !exists("w:SavedBufView")
        let w:SavedBufView = {}
    endif
    let w:SavedBufView[bufnr("%")] = winsaveview()
endfunction

" Restore current view settings.
function! AutoRestoreWinView()
    let buf = bufnr("%")
    if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
        let v = winsaveview()
        let atStartOfFile = v.lnum == 1 && v.col == 0
        if atStartOfFile && !&diff
            call winrestview(w:SavedBufView[buf])
        endif
        unlet w:SavedBufView[buf]
    endif
endfunction

" When switching buffers, preserve window view.
if v:version >= 700
    autocmd BufLeave * call AutoSaveWinView()
    autocmd BufEnter * call AutoRestoreWinView()
endif

" toggle space or tabs identation
"set noexpandtab
"set expandtab

"------ plugins settings ------

let g:quickr_cscope_use_qf_g = 1
let g:quickr_cscope_autoload_db = 0
let g:quickr_cscope_keymaps = 0
let g:quickr_cscope_program = "gtags-cscope"
let g:quickr_cscope_db_file = "GTAGS"

"nmap <buffer> <leader>s :Rg <C-R><C-W><CR>
"au FileType python nmap <buffer> <leader>s :Rg -tpy <C-R><C-W><CR>

nmap <leader>v :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
"au FileType c,cpp,h nmap <buffer> <leader>s <plug>(quickr_cscope_symbols)
nmap <leader>s <plug>(quickr_cscope_symbols)
nmap <leader>g <plug>(quickr_cscope_global)
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

" vim-ripgrep
" don't search in tags or cscope
"let g:rg_command='rg --vimgrep -g \!tags -g \!cscope.out -g \!cscope.po.out -g \!cscope.in.out'

set grepprg=rg\ --vimgrep
"set grepprg=lid\ --substring\ --result=grep\ '\\<$*\\>'\ \\\|\ sort

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('right:60%', 'ctrl-/')
  \           : fzf#vim#with_preview('right:60%', 'ctrl-/'),
  \   <bang>0)

" whitespace handling
let g:better_whitespace_enabled=0
let g:strip_whitespace_on_save=1
let g:strip_only_modified_lines=1
let g:strip_whitespace_confirm=0

" easymotion
nmap ` <Plug>(easymotion-s2)
" search 2 symbols
nmap <c-space> <Plug>(easymotion-bd-w)
" search 2 below
"nmap t <Plug>(easymotion-f2)
"nmap t <Plug>(easymotion-t2)

"let g:fzf_preview_window = []
let g:fzf_preview_window = ['right:60%:hidden', 'ctrl-/']

if $DISPLAY == ""
	let g:XkbSwitchEnabled = 0
else
	let g:XkbSwitchEnabled = 1
	let g:XkbSwitchIMappings = ['ru']
endif

command Spell setlocal spell! spelllang=ru,en

" status line only if 2 windows
set laststatus=1

au FileType gitcommit setlocal tw=90
au BufNewFile,BufRead Jenkinsfile setf groovy

inoremap jj <Esc>
inoremap оо <Esc>

" use xorg clipboard
"set clipboard+=unnamedplus

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y

" " Paste from clipboard
"nnoremap <leader>p "+p
"nnoremap <leader>P "+P
"vnoremap <leader>p "+p
"vnoremap <leader>P "+P

" disable ex mode
map Q <Nop>

set csprg=gtags-cscope
silent! cs add GTAGS

nmap <leader>n :cn<CR>
nmap <leader>p :cp<CR>

" gitgutter
"let g:gitgutter_map_keys = 0
nmap <leader>d <Plug>(GitGutterPreviewHunk)
"nnoremap <leader>p :SignifyHunkDiff<cr>
"nnoremap <leader>u :SignifyHunkUndo<cr>
nmap <leader>j <Plug>(GitGutterNextHunk)
nmap <leader>k <Plug>(GitGutterPrevHunk)
nmap <leader>h <Plug>(GitGutterStageHunk)
