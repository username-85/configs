" for gitgutter also
set updatetime=100
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
set switchbuf=useopen,usetab
set complete=.,w,b,u,t
set timeoutlen=1000
set ttimeoutlen=100
"set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
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
map <F2> :update<CR>

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

"tagbar
let g:tagbar_compact = 1
au FileType c,cpp,h,python imap <F11> <Esc> :TagbarToggle<CR>a
au BufEnter *.h,*py imap <F11> <Esc> :TagbarToggle<CR>a
au FileType c,cpp,h,python nmap <F11> :TagbarToggle<CR>
au BufEnter *.h,*py nmap <F11> :TagbarToggle<CR>

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

let g:alternateNoDefaultAlternate=1

let g:bufExplorerFindActive=0

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

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
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

let g:fzf_preview_window = []

let g:XkbSwitchEnabled = 1


let g:cscopedb_big_file = 'cscope.out'
let g:cscopedb_small_file = 'cscope_small.out'
let g:cscopedb_auto_files = 1
let g:cscopedb_auto_init = 1


nmap <F9> <Plug>CscopeDBInit
command Spell setlocal spell! spelllang=ru,en

nmap <F8> :cs show<CR>

" status line only if 2 windows
set laststatus=1

au FileType gitcommit setlocal tw=90
au BufNewFile,BufRead Jenkinsfile setf groovy

imap jj <Esc>
imap оо <Esc>
