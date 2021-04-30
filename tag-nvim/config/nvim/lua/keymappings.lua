local utils = require'config.utils'
local map = utils.map

-- Keybindings
local silent = { silent = true }
-- Window movement
map('n', '<c-h>', '<c-w>h')
map('n', '<c-j>', '<c-w>j')
map('n', '<c-k>', '<c-w>k')
map('n', '<c-l>', '<c-w>l')

-- akinsho/nvim-bufferline.lua
map('n', '[b', '<cmd>BufferLineCycleNext<cr>', silent)
map('n', ']b', '<cmd>BufferLineCyclePrev<cr>', silent)

-- nvim-telescope/telescope.nvim
map('n', '<leader>ff', '<cmd>Telescope find_files prompt_prefix=📂<cr>')
map('n', '<leader>fd', '<cmd>Telescope live_grep prompt_prefix=🔍<cr>')

-- kyazdani42/nvim-tree.lua
map('n', '<leader>e', '<cmd>NvimTreeToggle<cr>')
