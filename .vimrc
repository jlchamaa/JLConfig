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
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'junegunn/fzf.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'Valloric/YouCompleteMe'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-fugitive'
Plugin 'posva/vim-vue'
call vundle#end()


" General VIM
set mouse=n
"set t_Co=256
syntax on
set wrap
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
set splitbelow
set splitright
set nobackup
set noundofile
set cursorline
set clipboard=unnamedplus "allows copying between vim buffers
set hlsearch
imap jj <Esc>

" Disable Arrow keys 
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" flash the line that contains the cursor
noremap <silent> ; :hi CursorLine ctermbg=cyan<CR>:set cursorcolumn<CR>:sleep 100m<CR>:hi CursorLine ctermbg=239<CR>:set nocursorcolumn<CR>
map n n;
map N N;
noremap # #;
noremap * *;
hi CursorLine ctermbg=236
hi CursorColumn ctermbg=Cyan
hi MatchParen ctermbg=blue guibg=lightblue

" F5 remove trailing whitespace from file
:nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>


" ##### PLUGIN OPTIONS #####

" airline
let g:airline_theme='wombat'
let g:airline#extensions#branch#displayed_head_limit = 15
let g:airline#extensions#default#section_truncate_width = {
\ 'b': 100,
\ 'x': 150,
\ 'y': 250,
\ 'z': 45,
\ 'warning': 80,
\ 'error': 80,
\ }


" syntastic
let g:syntastic_python_checkers = ['python', 'flake8']
let g:syntastic_python_flake8_post_args='--ignore=E501'
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++11'

" rainbow_parens
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


" FZF Keybinding
noremap <C-a> :GFiles $(get_current_repo)<CR>
noremap <C-q> :Buffers<CR>
noremap <C-p> :Jlc<CR>
function! Convert_file_to_current_repo(curr_file)
    let cur_wd=fnamemodify(getcwd(), ":p")

    if cur_wd !~ "/home/jlchamaa/d"
        " we're not in a repo return all unmodified
        return fnamemodify(a:curr_file, ":~")
    endif

    let currepo=fnamemodify(cur_wd, ':s?/home/jlchamaa/d\w*\zs.*??:p')
    let currfile=fnamemodify(a:curr_file, ':p')
    return fnamemodify(currfile, ':s?/home/jlchamaa/d\w*/\ze?\=l:currepo?:~')
endfunction

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

command! -bang Jlc call fzf#run({
\  'source': fzf#vim#_uniq(extend(
\ map(filter(range(1, bufnr("$")), "buflisted(v:val)"), "Convert_file_to_current_repo(bufname(v:val))"),
\ filter(map(copy(v:oldfiles),"Convert_file_to_current_repo(v:val)"),"filereadable(fnamemodify(v:val, ':p'))"))),
\  'sink' : 'e',
\  'down' : '30%',
\  'options': '+m -x +s'})


" tmux-vim-navigator
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-/> :TmuxNavigatePrevious<cr>
