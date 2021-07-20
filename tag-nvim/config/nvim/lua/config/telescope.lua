-- This will load fzy_native and have it override the default file sorter
require('telescope').load_extension 'fzy_native'
require('telescope').setup {
  defaults = {
    prompt_prefix = '🔭 ',
    selection_caret = ' ',
  },
}

--Add leader shortcuts
vim.api.nvim_set_keymap(
  'n',
  '<leader>bb',
  [[<cmd>lua require('telescope.builtin').buffers()<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n',
  '<leader>ff',
  [[<cmd>lua require('telescope.builtin').find_files({prompt_prefix=📂})<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n',
  '<leader>fb',
  [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n',
  '<leader>fd',
  [[<cmd>lua require('telescope.builtin').grep_string()<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n',
  '<leader>fg',
  [[<cmd>lua require('telescope.builtin').live_grep()<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n',
  '<leader>fh',
  [[<cmd>lua require('telescope.builtin').help_tags()<CR>]],
  { noremap = true, silent = true }
)

