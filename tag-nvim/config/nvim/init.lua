require'plugins'
require'settings'
require'config'

-- Disable some built-in plugins we don't want
local disabled_built_ins = {
  'gzip',
  'getscript',
  'getscriptPlugin',
  'vimball',
  'vimballPlugin',
  'man',
  'matchit',
  'matchparen',
  '2html_plugin',
  'logiPat',
  'rrhelper',
  'shada_plugin',
  'tar',
  'tarPlugin',
  'zip',
  'zipPlugin',
  'netrw',
  'netrwPlugin',
  'netrwSettings',
  'netrwFileHandlers',
}

for i = 1, 10 do
  vim.g['loaded_' .. disabled_built_ins[i]] = 1
end

-- Window movement
vim.api.nvim_set_keymap('n', '<c-h>', '<c-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-j>', '<c-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-k>', '<c-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-l>', '<c-w>l', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'H', '<cmd>vertical resize -10<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'L', '<cmd>vertical resize +10<CR>', { noremap = true, silent = true })

-- Clear Hlsearch
vim.api.nvim_set_keymap('n', '<leader><leader>', [[<CMD>noh<CR>]], { noremap = true ,silent = true })

-- Highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
  ]],
  false
)

-- Terminal
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map('t', '<ESC>', [[<C-\><C-n>]], opts)
map('n', '<leader>nt', [[<CMD>tabnew | term<CR>]], opts)
map('n', '<leader>lg', [[<CMD>tabnew | term lazygit<CR>]], opts)
