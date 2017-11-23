execute pathogen#infect()

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'scrooloose/syntastic'
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'crusoexia/vim-monokai'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
"Plugin 'davidhalter/jedi-vim'
"Plugin 'Valloric/YouCompleteMe'
call vundle#end()
"set t_Co=256
syntax on
"colorscheme Monokai-Refined
"filetype plugin indent on

set nowrap
set ignorecase   " ignores case when searching
set smartcase    " only sometimes

set smartindent  " smart indent...
set tabstop=4    " tabs are 4
set shiftwidth=4 " >> and << shift 4 spaces
set expandtab    " converts tabs to 4 spaces

set nu
set rnu

au FocusLost * :set nu
au FocusGained * :set rnu

au InsertEnter * :set nu
au InsertLeave * :set rnu

let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++11' 
set clipboard=unnamed "allows copying between vim buffers

set nobackup
set noundofile
