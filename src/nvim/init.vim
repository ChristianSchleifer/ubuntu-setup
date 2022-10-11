syntax enable

set noerrorbells

set exrc

set guicursor=
set relativenumber
set number
set nohlsearch
set hidden

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set showcmd
set incsearch
set cursorline
set scrolloff=8
set signcolumn=yes
set colorcolumn=100

let mapleader = " "

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
call plug#end()

colorscheme gruvbox
set background=dark
set backspace=indent,eol,start