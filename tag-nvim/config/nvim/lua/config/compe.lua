-- Compe and Vsnip setup
-- Map compe confirm and complete functions
vim.api.nvim_set_keymap('i', '<c-b>', 'compe#complete()', { expr = true, noremap = true })
vim.api.nvim_set_keymap('i', '<c-e>', 'compe#close()', { expr = true, noremap = true })

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- Load vsnip snippets
vim.g.vsnip_snippet_dir = '$HOME/.config/nvim/snippets'

-- Use (s-)tab to:
--- confirm item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return vim.fn['compe#confirm']()
  elseif vim.fn['vsnip#available'](1) == 1 then
    return t '<Plug>(vsnip-expand-or-jump)'
  else
    return t '<Tab>'
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t '<C-p>'
  elseif vim.fn['vsnip#jumpable'](-1) == 1 then
    return t '<Plug>(vsnip-jump-prev)'
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t '<S-Tab>'
  end
end

vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.tab_complete()', { expr = true })
vim.api.nvim_set_keymap('s', '<Tab>', 'v:lua.tab_complete()', { expr = true })
vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true })
vim.api.nvim_set_keymap('s', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true })

require('compe').setup {
  preselect = 'always',
  source = {
    path = true,
    nvim_lsp = true,
    nvim_lua = true,
    buffer = true,
    vsnip = true,
    spell = true,
  },
}


