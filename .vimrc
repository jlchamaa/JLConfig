set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set path=,,.,**,/usr/include,/usr/local/include
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf
:set tags=./tags;
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'gmarik/Vundle.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'posva/vim-vue'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-syntastic/syntastic'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()

let g:ycm_log_level = 'debug'
let g:ycm_server_log_level = 'debug'
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '!'
let g:ycm_global_ycm_extra_conf='~/driving/experimental/bryce/config/ycm_extra_conf.py'
let g:ycm_server_python_interpreter='/usr/bin/python3.6'
nnoremap <leader>g  :YcmCompleter GoTo<CR>
nnoremap <leader>F  :YcmCompleter FixIt<CR>

" General VIM
set mouse=n
set ttymouse=sgr
"set t_Co=256
syntax on
set wrap
set smartindent  " smart indent...
set expandtab    " converts tabs to 4 spaces
set ignorecase   " ignores case when searching
set smartcase    " only sometimes
set viminfo='500,<1000,s100,h
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
hi Search ctermbg=DarkYellow
hi Search ctermfg=Red
set pastetoggle=<F2>

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
noremap <silent> , :hi CursorLine ctermbg=cyan<CR>:set cursorcolumn<CR>:sleep 100m<CR>:hi CursorLine ctermbg=239<CR>:set nocursorcolumn<CR>
map n n,
map N N,
noremap # #,
noremap * *,
hi CursorLine ctermbg=236 cterm=NONE
hi CursorColumn ctermbg=Cyan
hi MatchParen ctermbg=blue guibg=lightblue

" F5 remove trailing whitespace from file
:nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" JSON Folding
function! FoldJson()
    set filetype=json
    syntax on
    set foldmethod=syntax
endfunction


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

" NERDTree
nnoremap <silent> <F6> :NERDTreeToggle<CR>
nnoremap <silent> <F7> :NERDTreeFind<CR>

" syntastic
" let g:syntastic_check_on_open=1 " Check for syntax errors on file open.
" let g:syntastic_echo_current_error=1 " Echo errors to the command window.
" let g:syntastic_enable_signs=1 " Mark lines with errors and warnings.
" let g:syntastic_enable_balloons=0 " Do not open error balloons over erroneous lines.
" let g:syntastic_cpp_check_header=1 " YCM will provide context for C++ files.
" let g:syntastic_c_check_header=1 " Same for C files.

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_cpp_checkers = []
" " let g:syntastic_cpp_checkers = ['clang_tidy']
" let g:syntastic_cpp_clang_tidy_exec = "/usr/bin/clang-tidy-4.0"
" let g:syntastic_always_populate_loc_list = 0
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 1

" let g:syntastic_python_python_exec = 'python3.6'
" let g:syntastic_python_checkers = ['python3.6', 'flake8']
" let g:syntastic_python_flake8_post_args='--ignore=E501,W503'

" let g:syntastic_cpp_compiler= 'clang'
" let g:syntastic_aggregate_errors = 1

" rainbow_parens
let loaded_matchparen = 1
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
let g:rbpt_colorpairs = [
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]


" FZF Keybinding
noremap <C-a> :GFiles $(get_current_repo)<CR>
noremap <C-s> :Files<CR>
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
" ""
command! -bang Jlc call fzf#run({
\  'source': fzf#vim#_uniq(extend(
\ map(filter(range(1, bufnr("$")), "buflisted(v:val)"), "Convert_file_to_current_repo(bufname(v:val))"),
\ filter(map(copy(v:oldfiles),"Convert_file_to_current_repo(v:val)"), "and(filereadable(fnamemodify(v:val, ':p')), stridx(v:val, 'bazel-out') < 0)"))),
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

" YCM
" Let clangd fully control code completion
" let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
" let g:ycm_clangd_binary_path = exepath("clangd")

" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_show_diagnostics_ui = 0
" let g:ycm_auto_hover=''
" let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
" let g:ycm_collect_identifiers_from_tags_files=1
" let g:ycm_semantic_triggers = {
    \   'python': [ 're!\w{2}', 're!(import\s+|from\s+(\w+\s+(import\s+(\w+,\s+)*)?)?)' ]
    \ }
"let g:ycm_disable_signature_help = 1
let g:coc_node_args = ['--nolazy', '--inspect=6045']

