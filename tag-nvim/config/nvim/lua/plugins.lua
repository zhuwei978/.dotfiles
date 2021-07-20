-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local fn = vim.fn
local execute = vim.api.nvim_command

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

vim.cmd(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost plugins.lua PackerCompile
  augroup end
  ]]
)

local use = require('packer').use
require('packer').startup(function()
  use {
    'dstein64/vim-startuptime',
    config = [[vim.g.startuptime_tries = 10]],
    cmd = "StartupTime"
  }
  use 'wbthomason/packer.nvim'
  use 'dracula/vim'
  use {
    'mattn/emmet-vim',
    config = [[require'config.emmet']]
  }
  use 'editorconfig/editorconfig-vim'
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = [[require'config.indent']]
  }
  use 'tpope/vim-surround'
  use {
     'windwp/nvim-autopairs',
      config = [[require'config.autopairs']]
  }
  use {
     'glepnir/lspsaga.nvim',
     config = [[require'config.lspsaga']]
  }
  use {
    'hoob3rt/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = [[require'config.statusline']]
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = [[require'config.treesitter']],
    run = ':TSUpdate',
  }
  use {
     'b3nj5m1n/kommentary',
     config = [[require'config.kcommentary']]
  }
  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && yarn install',
  }
  use {
     'norcalli/nvim-colorizer.lua',
     config = [[require'config.colorizer']]
  }
  use {
     'kyazdani42/nvim-tree.lua',
     config = [[require'config.tree']]
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzy-native.nvim' },
    },
    config = [[require'config.telescope']]
  }
  use 'digitaltoad/vim-pug'
  use {
     'kyazdani42/nvim-web-devicons',
     config = [[require'config.devicons']],
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = [[require'config.gitsigns']]
  }
  use 'neovim/nvim-lspconfig'
  use 'kabouzeid/nvim-lspinstall'
  use {
     'hrsh7th/nvim-compe',
     config = [[require'config.compe']]
  }
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
end)

