vim.g.python_host_prog = '/usr/bin/python'
vim.g.python3_host_prog = '/usr/local/bin/python3'

-- tab config
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.shiftround = true
vim.opt.inccommand = 'nosplit'
vim.opt.textwidth = 80
-- list chars
vim.opt.list = true
vim.opt.listchars = 'tab:»·,space:⋅,trail:+,extends:→,precedes:←'
-- lines below cursor
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5
-- better searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
-- number display in .opt.umn
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.wildignore = '*.o,*~,*.pyc'
-- switch buffer when saving them
vim.opt.hidden = true
vim.opt.mouse = 'nv'
vim.opt.breakindent = true
vim.bo.undofile = true
vim.opt.updatetime = 250
vim.opt.signcolumn = 'yes:1'
vim.opt.shortmess = vim.o.shortmess .. 'c'
-- Leader key
vim.g.mapleader = ' '
vim.opt.pumheight = 10
-- split in rea.opt.able positions
vim.opt.splitright = true
vim.opt.splitbelow = true
-- matching parenthesis
vim.opt.showmatch = true
-- fold
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevelstart = 99
vim.opt.completeopt = 'menuone,noselect,noinsert'
-- colorscheme settings
vim.opt.background = 'dark'
vim.opt.termguicolors = true
vim.cmd [[colorscheme dracula]]


