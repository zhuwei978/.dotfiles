local map = require('config.utils').map
local opts = {noremap = false, expr = true}

vim.g.vsnip_snippet_dir = '$HOME/.config/nvim/snippets'

map('i', '<c-j>', [[vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<c-j>']], opts)
map('s', '<c-j>', [[vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<c-j>']], opts)
map('i', '<c-k>', [[vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<c-k>']], opts)
map('s', '<c-k>', [[vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<c-k>']], opts)
