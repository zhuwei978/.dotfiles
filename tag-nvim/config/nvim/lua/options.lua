local g = vim.g
local cmd = vim.cmd
local o, wo, bo = vim.o, vim.wo, vim.bo
local utils = require('config.utils')
local opt = utils.opt
local autocmd = utils.autocmd
local map = utils.map

-- Leader
g.mapleader = " "
g.python_host_prog = '/usr/bin/python'
g.python3_host_prog = '/usr/local/bin/python3'

-- Disable some built-in plugins we don't want
local disabled_built_ins = {
  'gzip', 'man', 'matchit', 'matchparen', 'shada_plugin', 'tarPlugin', 'tar', 'zipPlugin', 'zip',
  'netrwPlugin'
}
for i = 1, 10 do g['loaded_' .. disabled_built_ins[i]] = 1 end

-- Settings
local buffer = {o, bo}
local window = {o, wo}

local tabWidth = 4
opt('textwidth', 100, buffer)
opt('scrolloff', 7)
opt('wrap', false, window)
opt('wildignore', '*.o,*~,*.pyc')
opt('wildmode', 'longest,full')
opt('inccommand', 'nosplit')
opt('pumheight', 15)
opt('splitright', true)
opt('splitbelow', true)
opt('lazyredraw', true)
opt('showmatch', true)
opt('ignorecase', true)
opt('hlsearch', false)
opt('smartcase', true)
opt('tabstop', tabWidth, buffer)
opt('softtabstop', 0, buffer)
opt('expandtab', true, buffer)
opt('shiftwidth', tabWidth, buffer)
opt('number', true, window)
opt('relativenumber', true, window)
opt('smartindent', true, buffer)
opt('laststatus', 2)
opt('showmode', false)
opt('shada', [['20,<50,s10,h,/100]])
opt('hidden', true)
opt('shortmess', o.shortmess .. 'c')
opt('completeopt', 'menuone,noselect')
opt('joinspaces', false)
opt('updatetime', 500)
opt('synmaxcol', 500, buffer)
opt('display', 'msgsep')
opt('cursorline', true, window)
opt('signcolumn', 'yes:1', window)

-- Colorscheme
opt('termguicolors', true)
opt('background', 'dark')
cmd [[colorscheme dracula]]
