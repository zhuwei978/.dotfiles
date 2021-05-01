local utils = require'config.utils'
local map = utils.map
local silent = { silent = true }

map('n', ']b', '<cmd>BufferLineCycleNext<cr>', silent)
map('n', '[b', '<cmd>BufferLineCyclePrev<cr>', silent)

require('bufferline').setup{
    options = {
      modified_icon = '✥',
      buffer_close_icon = '',
      mappings = true,
      always_show_bufferline = false,
    }
  }
