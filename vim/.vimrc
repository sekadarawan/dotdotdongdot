set nocompatible
set nobackup
set nowritebackup
set noswapfile
set history=100
set ruler
set showcmd
set incsearch
set hlsearch
set smartcase
set ignorecase
set nowrap
set backspace=indent,eol,start
set fillchars+=stl:\ ,stlnc:\
set et
set ts=4
set sw=4
set number
set laststatus=2
set encoding=utf-8
set statusline=%f\ %=L:%l/%L\ %c\ (%p%%)
set cursorline
set shortmess+=I
set noshowmode
set gfn=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
set guioptions-=T

set background=dark
colorscheme smyck

syntax on
filetype plugin indent on

let g:airline_powerline_fonts = 1
let g:airline_theme="badwolf"
