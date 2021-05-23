" Author: Jonathan Terner
" Date: Mon Jul 10 11:50:57 EDT 2017
"
" Changelog:
" Jonathan Terner
" 25 July 2017
" * changed textmode spacing line wrap
" * mapped ; to :
"
"Table of contents:
" - Set up basic behavior of vim 
" - Key mappings/abrv/snippets
" - Language specific settings
"


syntax on "turn on syntax highlighting
set showmode "cues the user if they are in insert mode
set showcmd "shows partially completed commands
set matchpairs+=<:> "bounce between < >s with % as well as other brackets

"---------- Set up basic behavior of vim ----------

"https://github.com/morhetz/gruvbox
colorscheme gruvbox
set background=dark
set cursorline

"set up indentation for coding style
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent


"window splits
set splitright

"file searching and tab completion
set path+=**
set wildmenu

"buffers
set hidden
set hlsearch
set smartcase
set autoread
"----------------------------------------

"---------- Key mappings/abrv/snippets---------- 
"TODO consider using localleader
let mapleader=" "
" semicolon now maps to colon
nnoremap ; :

"escape me
inoremap jk <esc>

"window switching
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"----------------------------------------

"Plugins
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/MarcWeber/vim-addon-mw-utils.git'
Plug 'https://github.com/tomtom/tlib_vim.git'
Plug 'https://github.com/garbas/vim-snipmate.git'
Plug 'https://github.com/majutsushi/tagbar'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'elixir-editors/vim-elixir'
call plug#end()

filetype plugin on

"enable tagbar
nmap <F8> :TagbarToggle<CR>
"vim airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"---------- Language specific settings --------------------

augroup general_settings
  autocmd!
  autocmd BufReadPost * '"
augroup END

augroup langauge_settings
  autocmd!

  "plain text mode
  autocmd FileType text call SetTextMode()
  "python settings
  autocmd FileType python call SetPythonSettings()
  "perl settings
  autocmd FileType perl call SetPerlSettings() 
  "sh settings
  autocmd FileType sh call SetShSettings() 

  "c settings
  autocmd FileType c call SetCSettings()

  "cpp settings
  autocmd FileType cpp call SetCppSettings()
augroup END

"==== helper functions for settings

" The following code is used to make vim aware of what type of file
"   it is working on. I was going to use it for snippet like things

" configure programming mode
function SetProgMode()
  set number
  set spell
  set relativenumber
  " enable folds at top level
  setlocal foldmethod=syntax
  setlocal foldnestmax=1
  setlocal foldlevel=20
  nnoremap <buffer> <leader>f za

  " space is my leader key
endfunction

" configure text mode
function SetTextMode()
  set spell
  set textwidth=90
endfunction

"set global settings for when I'm programming
function SetPythonSettings()
  call SetProgMode()
endfunction

function SetPerlSettings()
  call SetProgMode()
  set cindent
  "mappings
  nnoremap <buffer> <leader>c I#<esc>
endfunction

function SetShSettings()
  call SetProgMode()
  "mappings
  nnoremap <buffer> <leader>c I#<esc>
endfunction

function SetCSettings()
  call SetProgMode()
  set cindent
endfunction

function SetCppSettings()
  call SetProgMode()
  call SetCSettings()
endfunction
  
"--------------------
