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
Plug 'kyazdani42/nvim-web-devicons'
Plug 'tweekmonster/startuptime.vim'
Plug 'norcalli/nvim-colorizer.lua'
" explorer
Plug 'kyazdani42/nvim-tree.lua'
" completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" search
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
" tree-sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'digitaltoad/vim-pug'
" markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for': 'markdown'  }
Plug 'mzlogin/vim-markdown-toc'
Plug 'dhruvasagar/vim-table-mode', { 'for': 'markdown' }
" theme
Plug 'lifepillar/vim-gruvbox8'
Plug 'akinsho/nvim-bufferline.lua'
" Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
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
" background opacity

hi Normal guibg=NONE ctermbg=NONE

lua << EOF
-- nvim-treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
}

-- norcalli/nvim-colorizer.lua
require('colorizer').setup {
  'css';
  'javascript';
  'javascriptreact';
  'html';
  'less';
}

-- nvim-telescope/telescope.nvim
require'telescope'.setup {
  defaults = {
    file_sorter = require'telescope.sorters'.get_fzy_sorter,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
  },
}
require'telescope'.load_extension('fzy_native')

-- kyazdani42/nvim-web-devicons
require'nvim-web-devicons'.setup {
  override = {
    pug = {
      icon = "",
      color = "#e34c26",
      name = "pug",
    }
  },
  default = true,
}

-- akinsho/nvim-bufferline.lua
require'bufferline'.setup {}

-- glepnir/galaxyline.nvim
-- require'lua.myline'
EOF

" telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

set showtabline=2 
set noswapfile
set nowrap
" alert confirm modal when resolving read only files or quit with unsaved files
set confirm
set noshowmode
set pumheight=10
" indent
set autoindent
set smartindent
set relativenumber
set number
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

" source vimrc
nnoremap <silent> <LEADER>re :so %<CR>:noh<CR>
" work with coc-pairs for inserting new line and indent properly
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" explorer
nnoremap <LEADER>e :NvimTreeToggle<CR>

" Use <tab> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <tab> could be remapped by other vim plugin, try `:verbose imap <tab>`.
if exists('*complete_info')
  inoremap <expr> <tab> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<tab>"
else
  inoremap <expr> <tab> pumvisible() ? "\<C-y>" : "\<C-g>u\<tab>"
endif

inoremap <silent><expr> <c-b> coc#refresh()

" python3
let g:python3_host_prog = "/usr/local/bin/python3"

" Use `[d` and `]d` to navigate diagnostics
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

" To get correct comment highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+
