" Author: Jonathan Terner
" Date: Mon Jul 10 11:50:57 EDT 2017
"
" Changelog:
" Jonathan Terner
" 25 July 2017
" * changed textmode spacing line wrap
" * mapped ; to :
"
" 20 August 2018
" o Made things more organized
" o color scheme monokai
" o added powerline
"


syntax on "turn on syntax highlighting
set showmode "cues the user if they are in insert mode
set showcmd "shows partially completed commands
set matchpairs+=<:> "bounce between < >s with % as well as other brackets

"^^^^^^^^^^^^^^^
"Global behavior
"^^^^^^^^^^^^^^^
colorscheme monokai
set background=dark
set cursorline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"set up indentation for coding style
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent

"set line numbers
set nu
set rnu

"window splits
"set splitright

"file searching and tab completion
set path+=**
set wildmenu

"buffers
set hidden
set hlsearch
set smartcase
set autoread

"fix basic ctags stuff
set csprg=/usr/local/bin/cscope
set cscopetag
set csre

"^^^^^^^^^^^^^
"Mode handling
"^^^^^^^^^^^^^
" My new setup will work using modes
" First, s:DetectMode is called:
"   this will set the g:mode based on where you current directory
" Once g:mode is defined, we will call s:SetMode
let g:mode = "none"

" Available modes:
" - gnrmode: settings  for working with gnr
" TODO: replace detect mode with env variable
function! s:DetectMODE()
  let l:cwd = system('pwd')
  " this is rough check to see if we are in a directory tree
  if l:cwd =~ $SHARKCLONEROOT
    let g:mode="gnrmode"
  endif
endfunction


function! s:SetMode()
  if g:mode == "gnrmode"
    call s:SetGNRMode()
  endif
endfunction

command! SetMode call s:SetMode()



" do things if we are in in gnr code
function! s:SetGNRMode()
  set cscopetag
  if  system('pwd') != $SHARKCLONEROOT 
    "TODO this line doesn't work as inteneded
    "cs add $SHARKCLONEROOT/cscope.out
  endif

  augroup au_commnands
    autocmd!
    "send to cluster
    "TODO the line below has problems. Fix this later
    "autocmd BufWrite * :silent echom "push"| !~/bin/rpush > /dev/null 2>&1 &
    "autocmd BufEnter *.* '" 
  augroup END
endfunction

call s:DetectMODE()
call s:SetMode()

"^^^^^^^^
"Mappings
"^^^^^^^^
"TODO consider using localleader
let mapleader=" "
" semicolon now maps to colon
nnoremap ; :

"some of my handy mappings with space bar
nnoremap <leader>b :b#<cr>
nnoremap <leader>/ :noh<cr>
nnoremap <leader>l :bn<CR>
nnoremap <leader>h :bp<CR>
"toggle line numbers with space n
nnoremap <leader>n :set rnu! <bar>set nu!<CR> 
" delete current buffer and switch to previous
nnoremap <leader>d :bp<CR>:bd#<CR>

"escape me
inoremap jk <esc>

"window switching
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"----------------------------------------

"^^^^^^^
"Plugins
"^^^^^^^
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/MarcWeber/vim-addon-mw-utils.git'
Plug 'https://github.com/tomtom/tlib_vim.git'
Plug 'https://github.com/garbas/vim-snipmate.git'
Plug 'https://github.com/majutsushi/tagbar'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/tpope/vim-surround'
call plug#end()

filetype plugin on

"enable tagbar
nmap <F8> :TagbarToggle<CR>


