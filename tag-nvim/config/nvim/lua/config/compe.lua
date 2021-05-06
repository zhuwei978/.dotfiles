local map = require'config.utils'.map

local opts = {silent = true, noremap = true, expr = true}
map('i', '<c-b>', [[compe#complete()]], opts)
map('i', '<Tab>', [[compe#confirm('<Tab>')]], opts)
map('i', '<c-e>', [[compe#close()]], opts)

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'always';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    vsnip = true,
    path = true,
    buffer = true,
    calc = true,
    nvim_lsp = true,
    nvim_lua = true,
    spell = true,
    emoji = true,
  };
}
