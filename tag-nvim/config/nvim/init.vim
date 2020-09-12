" no compatible for vi
set nocompatible
" automatically installing vim-plug and relative plugins when vim-plug has not
" been installed
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
Plug 'morhetz/gruvbox'
Plug 'mhartington/oceanic-next'
Plug 'sainnhe/gruvbox-material'
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

let mapleader = ' '

filetype plugin indent on
syntax on
" gruvbox theme config
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_transparent_background = 1
set background=dark
" Important!!
set termguicolors
colorscheme gruvbox-material
set cursorline
set showtabline=2 
set noswapfile                 " 禁止生成临时文件
set nowrap
set confirm                    " 在处理未保存或只读文件的时候，弹出确认
set noshowmode                 " 已经有 lightline 了，无须显示命令
set nrformats=bin,hex          " 对待所有数字为十进制数，这样在使用<C-a><C-x>的时候可以正常的加减
set pumheight=10
set autoindent
set relativenumber
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set scrolloff=5
set ignorecase                 " 搜索忽略大小写
set hlsearch                   " 搜索逐字符高亮
set incsearch
set smartcase
set splitright
set clipboard+=unnamedplus     " use system clipboard

" netrw
let g:netrw_banner = 0 " hidden banner
let g:netrw_winsize = 25
let g:netrw_liststyle = 3 " tree style

" navigate in vim
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
nnoremap H <C-w>10>
nnoremap L <C-w>10<
nnoremap <silent> <LEADER><SPACE> :noh<CR>

" file operaion
nnoremap <LEADER>w :w<CR>
nnoremap <LEADER>q :q<CR>

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

" coc_extensions
let g:coc_global_extensions = ['coc-explorer', 'coc-emmet', 'coc-eslint', 'coc-git', 'coc-go', 'coc-css', 'coc-json', 'coc-lists', 'coc-python', 'coc-pairs', 'coc-prettier', 'coc-snippets', 'coc-tsserver', 'coc-vimlsp', 'coc-yaml']
" lightline
let g:lightline = {
  \ 'active': {
  \   'left': [
  \     [ 'mode', 'paste' ],
  \     [ 'git', 'cocstatus', 'filename' ]
  \   ],
  \   'right':[
  \     [ 'filetype', 'fileencoding', 'lineinfo', 'percent' ],
  \   ],
  \ },
  \ 'component_function': {
  \   'git': 'LightlineGitStatus',
  \   'cocstatus': 'coc#status',
  \ }
\ }
let g:lightline = {'colorscheme' : 'gruvbox_material'}
function! LightlineGitStatus() abort
  let git_status = get(g:, 'coc_git_status', '')
  " return git_status
  return winwidth(0) > 120 ? git_status : ''
endfunction

autocmd bufnewfile,bufread *.ts set filetype=typescript.tsx
autocmd bufnewfile,bufread *.js set filetype=javascript.jsx
autocmd User CocStatusChange,CocDiagnosticChange,CocGitStatusChange call lightline#update()
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')           " function signature"

" if hidden is not set, TextEdit might fail.
set hidden
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
" Better display for messages
" set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=100
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
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
command! -nargs=0 Format :call CocAction('format')
" use `:OR` for organize import of current buffer
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" To get correct comment highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+

" open help file in right window
autocmd FileType help wincmd L
