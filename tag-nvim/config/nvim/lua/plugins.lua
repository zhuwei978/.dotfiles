local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup(function(use)
    use 'editorconfig/editorconfig-vim'
    use 'wbthomason/packer.nvim'
    use 'tpope/vim-surround'
    use 'mattn/emmet-vim'
    use 'Raimondi/delimitMate'
    use 'tomtom/tcomment_vim'
    use {
        'nvim-treesitter/nvim-treesitter',
        requires = {
            'nvim-treesitter/nvim-treesitter-textobjects',
            'nvim-treesitter/playground',
        },
        config = [[require'config.treesitter']],
        run = ':TSUpdate'
    }
    use {
        'iamcco/markdown-preview.nvim',
        run = 'cd app && yarn install',
    }
    use 'dracula/vim'
    use 'tweekmonster/startuptime.vim'
    use {
        'norcalli/nvim-colorizer.lua',
        config = [[require'config.colorizer']]
    }
    use {
        'kyazdani42/nvim-tree.lua',
        config = [[require'config.nvim-tree']],
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-fzy-native.nvim'},
        },
        config = [[require'config.telescope']],
    }
    use 'digitaltoad/vim-pug'
    use {
        'kyazdani42/nvim-web-devicons',
        config = [[require'config.icon']],
    }
    use {
        'akinsho/nvim-bufferline.lua',
        config = [[require'config.bufferline']],
        requires = {'kyazdani42/nvim-web-devicons'}
    }
    use {
        'glepnir/galaxyline.nvim',
        branch = 'main',
        config = [[require'config.statusline']],
        requires = {'kyazdani42/nvim-web-devicons'}
    }
    use {
        'lewis6991/gitsigns.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = [[require'config.gitsigns']],
    }
    use {
         'neovim/nvim-lspconfig',
         requires = {'kabouzeid/nvim-lspinstall'},
         config = [[require'config.lsp']],
    }
    use {
        'hrsh7th/nvim-compe',
        config = [[require'config.compe']],
    }
    use {
        'hrsh7th/vim-vsnip',
        config = [[require'config.vsnip']],
    }
end)
