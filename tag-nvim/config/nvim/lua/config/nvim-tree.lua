local utils = require'config.utils'
local map = utils.map

map('n', '<leader>e', '<cmd>NvimTreeToggle<cr>')

vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_quit_on_open = 1
