" Author: Jonathan Terner
" Date: Mon Jul 10 11:50:57 EDT 2017
" This is my vimrc file. By default, it will not use any external plugins
" That being said, I might write my own plugins and other dependencies, but 
"   not dependencies from the internet. I will provide documentation if this
"   is the case
"
"Table of contents:
" - Set up basic behavior of vim 
" - Key mappings/abrv/snippets
" - Language specific settings
"

"TODO make template commands for C programs
"TODO make your own snippets

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

"escape me
inoremap jk <esc>

"window switching
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"----------------------------------------

"---------- Plugins ----------

" For offline use
call plug#begin('~/.vim/plugged')
Plug '~/.vim/plugged/tlib_vim'
Plug '~/.vim/plugged/vim-addon-mw-utils'
Plug '~/.vim/plugged/vim-snipmate'
call plug#end()

filetype plugin on

"---------- Language specific settings --------------------


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

" configure programming mode
function SetProgMode()
  set number
  set spell
  set relativenumber
  " space is my leader key
  let mapleader = " "
  " semicolon now maps to colon
  nnoremap ; :
endfunction

" configure text mode
function SetTextMode()
  set spell
  set textwidth=80
endfunction

"set global settings for when I'm programming
function SetPythonSettings()
  call SetProgMode()
  "mappings
  "snippets
  iabbrev <buffer> iff if:<left>
endfunction

function SetPerlSettings()
  call SetProgMode()
  set cindent
endfunction

function SetShSettings()
  call SetProgMode()
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
