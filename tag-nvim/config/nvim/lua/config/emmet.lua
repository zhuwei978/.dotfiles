-- Emmet settings
vim.g.user_emmet_complete_tag = 0
vim.g.user_emmet_install_global = 0
vim.g.user_emmet_install_command = 0
vim.g.user_emmet_mode = 'i'
vim.g.user_emmet_settings = {
  javascript = {
    extends = 'jsx',
  },
  typescript = {
    extends = 'jsx',
  },
}
vim.cmd [[autocmd FileType html,css,javascript,typescript,javascriptreact,typescriptreact EmmetInstall]]


