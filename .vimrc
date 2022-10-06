set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set path=,,.,**,/usr/include,/usr/local/include
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf
:set tags=./tags;
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'antoinemadec/coc-fzf'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'gmarik/Vundle.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'neoclide/coc.nvim'
Plugin 'posva/vim-vue'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()


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


set statusline+=%#warningmsg#
set statusline+=%*


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

" coc
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" make it an un-ugly color
hi CocFloating ctermbg=0 

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes
hi SignColumn ctermbg=0

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.

inoremap <expr> <up> coc#pum#visible() ? (coc#pum#info().reversed ? coc#pum#next(1): coc#pum#prev(1)): "\<up>"
inoremap <expr> <down> coc#pum#visible() ? (coc#pum#info().reversed ? coc#pum#prev(1): coc#pum#next(1)): "\<down>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <tab> coc#pum#visible() ? coc#pum#confirm(): "\<tab>"

" inoremap <silent><expr> <TAB>
"       \ coc#pum#visible() ? coc#pum#next(1) :
"       \ CheckBackspace() ? "\<Tab>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
