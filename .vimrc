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
set nowrap
set ignorecase   " ignores case when searching
set smartcase    " only sometimes
set viminfo='100,<1000,s100,h

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

let g:syntastic_python_checkers = ['python', 'flake8']
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++11' 
set clipboard=unnamed "allows copying between vim buffers

set nobackup
set noundofile

" Disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" flash the line that contains the cursor
map ; :set cursorline<CR>:set cursorcolumn<CR>:sleep 150m<CR>:set nocursorline<CR>:set nocursorcolumn<CR>

" flash the cursor position after every search
map n n;
map N N;
map # #;
map * *;

" use bright yellow for the cursor location
hi CursorLine ctermbg=Cyan 
hi CursorColumn ctermbg=Cyan 
