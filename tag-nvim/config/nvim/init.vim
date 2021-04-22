" no compatible for vi
set nocompatible
" automatically installing vim-plug and relative plugins
" when vim-plug has not been installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.local/share/nvim/plugged')
" other
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'ryanoasis/vim-devicons'
Plug 'kdheepak/lazygit.nvim', { 'branch': 'nvim-v0.4.3' }
" completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" syntax
Plug 'sheerun/vim-polyglot'
" markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'mzlogin/vim-markdown-toc'
Plug 'dhruvasagar/vim-table-mode'
" theme
Plug 'itchyny/lightline.vim'
Plug 'lifepillar/vim-gruvbox8'
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

let mapleader = ' '

filetype plugin indent on
syntax enable
" theme
set background=dark
set termguicolors
colorscheme gruvbox8
let g:gruvbox_transp_bg = 1
hi Normal guibg=NONE ctermbg=NONE

set cursorline
set showtabline=2 
set noswapfile
set nowrap
" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 已经有 lightline 了，无须显示命令
set noshowmode
" 对待所有数字为十进制数，这样在使用<C-a><C-x>的时候可以正常的加减
set nrformats=bin,hex
set pumheight=10
set autoindent
set relativenumber
set nu
" tab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

set scrolloff=5
" search
set ignorecase
set incsearch
set smartcase
set nohlsearch

set completeopt=menuone,noselect
set mouse=a
set splitright
set splitbelow

let g:markdown_fenced_languages=['javascript', 'js=javascript', 'json=javascript']

" if hidden is not set, TextEdit might fail.
set hidden
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=50
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" navigate in vim
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
nnoremap H <C-w>10>
nnoremap L <C-w>10<

" open vimrc
nnoremap <silent> <LEADER>rc :tabe ~/.config/nvim/init.vim<CR>
nnoremap <silent> <LEADER>re :so %<CR>:noh<CR>
" work with coc-pairs for inserting new line and indent properly
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" lazygit
nnoremap <silent> <leader>lg :LazyGit<CR>

" coc-explorer
nnoremap <LEADER>e :CocCommand explorer<CR>

" Use <tab> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <tab> could be remapped by other vim plugin, try `:verbose imap <tab>`.
if exists('*complete_info')
  inoremap <expr> <tab> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<tab>"
else
  inoremap <expr> <tab> pumvisible() ? "\<C-y>" : "\<C-g>u\<tab>"
endif

inoremap <silent><expr> <c-b> coc#refresh()

" FZF
" ! for fullscreen
nnoremap <silent> <LEADER>p :GFiles!<CR>
nnoremap <LEADER>rg :Rg!<SPACE>
nnoremap <silent> <C-b> :Buffers!<CR>

" python3
let g:python3_host_prog = "/usr/local/bin/python3"

" coc_extensions
let g:coc_global_extensions = ['coc-pairs', 'coc-explorer', 'coc-emmet', 'coc-eslint', 'coc-git', 'coc-go', 'coc-css', 'coc-json', 'coc-lists', 'coc-python', 'coc-prettier', 'coc-snippets', 'coc-tsserver', 'coc-vimlsp', 'coc-yaml']

" lightline
function! LightlineGitBranch() abort
  let branch = get(g:, 'coc_git_status', '')
  " return blame
  return winwidth(0) > 120 ? branch : ''
endfunction
let g:lightline = {
  \ 'colorscheme': 'gruvbox8',
  \ 'active': {
  \   'left': [
  \     [ 'mode', 'paste' ],
  \     [ 'branch', 'filename', 'modified', 'cocstatus' ]
  \   ],
  \   'right':[
  \     [ 'filetype', 'fileencoding', 'lineinfo', 'percent' ],
  \   ],
  \ },
  \ 'component_function': {
  \   'branch': 'LightlineGitBranch',
  \   'cocstatus': 'coc#status',
  \ }
\ }

" function signature"
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gm <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
" Format the whole buffer
command! -nargs=0 Format :call CocActionAsync('format')
" use `:OR` for organize import of current buffer
command! -nargs=0 OR :call CocActionAsync('runCommand', 'editor.action.organizeImport')
" Remap for rename current word
nmap <LEADER>rn <Plug>(coc-rename)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" To get correct comment highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+
