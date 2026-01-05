vim.o.termguicolors = true
vim.cmd([[
set background=dark
colorscheme ultraviolent
autocmd VimEnter * :set winhighlight=Normal:activeNormal
autocmd BufEnter * :set winhighlight=Normal:activeNormal
autocmd BufLeave * :set winhighlight=activeNormal:Normal
autocmd WinEnter * :set winhighlight=Normal:activeNormal
autocmd WinLeave * :set winhighlight=activeNormal:Normal
autocmd FocusGained * :set winhighlight=Normal:activeNormal
autocmd FocusLost * :set winhighlight=activeNormal:Normal
]])
vim.cmd([[
" General NeoVim
unmap Y
syntax on
set wrap
set smartindent  " smart indent...
set expandtab    " converts tabs to 4 spaces
set ignorecase   " ignores case when searching
set smartcase    " only sometimes
set viminfo='500,<1000,s100,h
set nu
set rnu
set splitbelow
set splitright
set nobackup
set noundofile
set cursorline
set clipboard=unnamedplus "allows copying between vim buffers
set hlsearch
hi Search ctermbg=DarkYellow
hi Search ctermfg=Red

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
noremap <silent> , :set cursorcolumn<CR>:sleep 100m<CR>:set nocursorcolumn<CR>
map n n,
map N N,
noremap # #,
noremap * *,

" F5 remove trailing whitespace from file
:nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>


]])
-- " JSON Folding
-- function! FoldJson()
--     set filetype=json
--     syntax on
--     set foldmethod=syntax
-- endfunction
-- 
-- function! SynStack()
--   if !exists("*synstack")
--     return
--   endif
--   echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
-- endfunc
-- function! SynGroup()
--     let l:s = synID(line('.'), col('.'), 1)
--     echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
-- endfun
-- 
-- " ##### PLUGIN OPTIONS #####
require("config.lazy")
-- 
-- " airline
vim.g.airline_theme='wombat'
vim.g["airline#extensions#branch#displayed_head_limit"] = 15
vim.g["airline#extensions#default#section_truncate_width"] = {b=100, x=150, y=250, z=45, warning=80, error=80}
-- 
-- " NERDTree
vim.keymap.set('n', '<F6>', ':NERDTreeToggle<CR>', { noremap = true, silent = true, desc = 'Toggle NERD TREE' })
vim.keymap.set('n', '<F7>', ':NERDTreeFind<CR>', { noremap = true, silent = true, desc = 'Toggle NERD TREE' })
--
-- " syntastic
vim.cmd([[
set statusline += "%#warningmsg#"
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
]])

vim.cmd([[
let g:syntastic_cpp_clang_tidy_exec = "/usr/bin/clang-tidy-4.0"
let g:syntastic_auto_loc_list = 0

let g:syntastic_python_python_exec = 'python3.11'
let g:syntastic_python_checkers = ['python3.11', 'flake8', 'mypy']
let g:syntastic_python_flake8_post_args='--ignore=E501,W503,E203'
let g:syntastic_python_mypy_post_args='--follow-imports silent'
let g:syntastic_cpp_compiler= 'clang'
let g:syntastic_aggregate_errors = 1


" rainbow_parens
let loaded_matchparen = 1
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
let g:rbpt_colorpairs = [
    \ ['darkmagenta', '#fb58b4'],
    \ ['Darkblue',    '#deff8c'],
    \ ['darkgreen',   '#ebe087'],
    \ ['darkcyan',    '#7fecff'],
    \ ['darkmagenta', '#fb58b4'],
    \ ['Darkblue',    '#deff8c'],
    \ ['darkgreen',   '#ebe087'],
    \ ['darkcyan',    '#7fecff'],
    \ ['darkred',     '#e681ff'],
    \ ['red',         '#69fcd3'],
    \ ['darkmagenta', '#fb58b4'],
    \ ['Darkblue',    '#deff8c'],
    \ ['darkgreen',   '#ebe087'],
    \ ['darkcyan',    '#7fecff'],
    \ ['darkred',     '#e681ff'],
    \ ['red',         '#69fcd3'],
    \ ]
]])

-- " FZF Keybinding

function GetBuffers()
    local bufs = {}
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_get_name(buf) ~= "" and vim.api.nvim_buf_is_loaded(buf) then
            buf_path = vim.api.nvim_buf_get_name(buf)
            buf_path = vim.fn.fnamemodify(buf_path, ":p")
            table.insert(bufs, buf_path)
        end
    end
    return bufs
end

function GetAllFiles()
  local buffers = GetBuffers()
  for _, oldfile in ipairs(vim.v.oldfiles) do
     table.insert(buffers, oldfile)
  end
  return buffers
end


function GetMyFiles()
  local fs = GetAllFiles()
  local out = {}
  for k, v in pairs(fs) do  -- #v is the size of v for lists.
    v = vim.fn.fnamemodify(v, ':p')
    -- Replace other drivings with current driving
    v = RebaseFile(v)
    if vim.uv.fs_stat(v) then
      v = vim.fn.fnamemodify(v, ":~")
      table.insert(out, v)
    end
  end
  return out 
end

function RebaseFile(path)
    -- Replace homedir with ~
  local cur_wd = vim.fn.fnamemodify(vim.fn.getcwd(), ":p")
  if string.find(cur_wd, "home/jlchamaa/d") then
    local currepo=vim.fn.fnamemodify(cur_wd, ':s?/home/jlchamaa/d\\w*\\zs.*??:p')
    local expanded = ":s?/home/jlchamaa/d\\w*/\\ze?" .. currepo .. "?:p"
    return vim.fn.fnamemodify(path, expanded)
  end
  return path
end

vim.api.nvim_create_user_command(
  'JLCFiles',
  function(input)
    -- FzfLua.combine({ prompt="lol> ", pickers = "oldfiles;files" })
    -- FzfLua.fzf_exec({ "line1", "line2"}, {prompt="lol> "})
    local fs = GetMyFiles()
    require'fzf-lua'.fzf_exec(fs, {
      prompt="🔥 > ",
      actions={
        ['default'] = require'fzf-lua'.actions.file_edit,
      },
    })
  end,
  {bang = true, desc = 'Search projects folder'}
)
vim.keymap.set('n', '<C-p>', ':JLCFiles<CR>', { noremap = true, silent = true, desc = 'Search' })
vim.keymap.set('n', '<C-s>', ':FzfLua<CR>', { noremap = true, silent = true, desc = 'FILES' })
vim.keymap.set('n', '<C-q>', ':Buffers<CR>', { noremap = true, silent = true, desc = 'BUFFERS' })

vim.lsp.enable('pyright')
-- vim.diagnostic.config({ virtual_text = false, virtual_lines = { current_line = true }, })
vim.diagnostic.config({ signs = true , virtual_text = true })
