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
    cmd = "StartupTime"
  }
  use 'wbthomason/packer.nvim'
  use 'dracula/vim'
  use {
    'mattn/emmet-vim',
  }
  use 'editorconfig/editorconfig-vim'
  use {
    'lukas-reineke/indent-blankline.nvim',
  }
  use 'tpope/vim-surround'
  use {
     'windwp/nvim-autopairs',
  }
  use {
     'glepnir/lspsaga.nvim',
  }
  use {
    'hoob3rt/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    run = ':TSUpdate',
  }
  use {
     'b3nj5m1n/kommentary',
  }
  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && yarn install',
  }
  use {
     'norcalli/nvim-colorizer.lua',
  }
  use {
     'kyazdani42/nvim-tree.lua',
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzy-native.nvim' },
    },
  }
  use 'digitaltoad/vim-pug'
  use {
     'kyazdani42/nvim-web-devicons',
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  }
  use 'neovim/nvim-lspconfig'
  use 'kabouzeid/nvim-lspinstall'
  use {
     'hrsh7th/nvim-compe',
  }
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
end)

