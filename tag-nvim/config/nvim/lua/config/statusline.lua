-- Statusline settings
function CurrentLsp()
  local msg = 'No Active Lsp'
  local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
  local clients = vim.lsp.get_active_clients()
  if next(clients) == nil then
    return msg
  end
  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      return client.name
    end
  end
  return msg
end

require('lualine').setup {
  options = {
    theme = 'dracula',
    component_separators = '',
    section_separators = '',
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'filename' },
    lualine_c = { 'branch', 'diff' },
    lualine_x = {
      { CurrentLsp, icon = ' LSP:' },
      {
        'diagnostics',
        sources = { 'nvim_lsp' },
      },
      'fileformat',
      { 'o:encoding', upper = true },
    },
    lualine_y = { 'filetype' },
    lualine_z = { 'location', 'progress' },
  },
  tabline = {
    lualine_a = { 'filename' },
  },
}


