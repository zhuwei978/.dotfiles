local utils = require'config.utils'
local map = utils.map

-- Keybindings
local silent = { silent = true }
-- Window movement
map('n', '<c-h>', '<c-w>h')
map('n', '<c-j>', '<c-w>j')
map('n', '<c-k>', '<c-w>k')
map('n', '<c-l>', '<c-w>l')
