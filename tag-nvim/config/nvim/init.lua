local cmd = vim.cmd
cmd 'autocmd BufWritePost plugins.lua PackerCompile'

require'options'
require'plugins'
require'keymappings'
