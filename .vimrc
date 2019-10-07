set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'scrooloose/syntastic'
"Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'junegunn/fzf.vim'
Plugin 'kien/rainbow_parentheses.vim'
"Plugin 'crusoexia/vim-monokai'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
"Plugin 'davidhalter/jedi-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'posva/vim-vue'
call vundle#end()
"set t_Co=256
let g:airline_theme='wombat'

syntax on
set nowrap
set ignorecase   " ignores case when searching
set smartcase    " only sometimes
set viminfo='500,<1000,s100,h

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
let g:syntastic_python_flake8_post_args='--ignore=E501'
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++11'
set clipboard=unnamedplus "allows copying between vim buffers

set nobackup
set noundofile
set cursorline

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
noremap <silent> ; :hi CursorLine ctermbg=cyan<CR>:set cursorcolumn<CR>:sleep 100m<CR>:hi CursorLine ctermbg=239<CR>:set nocursorcolumn<CR>

" flash the cursor position after every search
map n n;
map N N;
noremap # #;
noremap * *;

" obsolete escape key
imap jj <Esc>

" use bright yellow for the cursor location
hi CursorLine ctermbg=236
hi CursorColumn ctermbg=Cyan
hi MatchParen ctermbg=blue guibg=lightblue

" F5 remove trailing whitespace from file
:nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" Alt-P to paste smartly
nnoremap <silent> <m-P> : <C-S-v>

" FZF Keybinding
noremap <C-a> :GFiles ~/driving<CR>
noremap <C-p> :History<CR>
let loaded_matchparen = 1
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
