-- Lspsaga
require('lspsaga').init_lsp_saga {
  code_action_prompt = {
    virtual_text = false,
  },
  max_preview_lines = 20,
}

vim.api.nvim_set_keymap(
  'n',
  'gh',
  [[<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n',
  '<leader>ca',
  [[<cmd>lua require('lspsaga.codeaction').code_action()<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'v',
  '<leader>ca',
  [[<cmd><C-U>lua require('lspsaga.codeaction').code_action()<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n',
  'K',
  [[<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n',
  '<C-f>',
  [[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n',
  '<C-b>',
  [[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n',
  'gp',
  [[<cmd>lua require'lspsaga.provider'.preview_definition()<CR>]],
  { noremap = true, silent = true }
)
