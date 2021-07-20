-- Nvim-tree
local tree_cb = require('nvim-tree.config').nvim_tree_callback
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_hide_dotfiles = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_bindings = {
  { key = 'e', cb = tree_cb 'edit' },
  { key = 'v', cb = tree_cb 'vsplit' },
  { key = 'i', cb = tree_cb 'split' },
}
vim.g.nvim_tree_icons = {
  default = '',
  symlink = '',
}
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })


