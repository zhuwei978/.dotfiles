local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup(function()
    use {'wbthomason/packer.nvim', opt = true}
    use {
        'blackCauldron7/surround.nvim',
        opt = true,
        config = [[require'surround'.setup {}]]
    }
    use {'tomtom/tcomment_vim', opt = true}
    use {
        'nvim-treesitter/nvim-treesitter',
        requires = {
            'nvim-treesitter/nvim-treesitter-textobjects'
        },
        config = [[require('config.treesitter')]],
        run = ':TSUpdate'
    }
    use {
        'iamcco/markdown-preview.nvim',
        run = 'cd app && yarn install',
        cmd = 'MarkdownPreview'
    }
    use 'dracula/vim'
    use 'tweekmonster/startuptime.vim'
    use {
        'norcalli/nvim-colorizer.lua',
        config = [[require('config.colorizer')]]
    }
    use {
        'kyazdani42/nvim-tree.lua', 
        cmd = 'NvimTreeToggle',
        requires = {'kyazdani42/nvim-web-devicons'}
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        config = [[require('config.telescope')]],
        cmd = 'Telescope'
    }
    use 'nvim-telescope/telescope-fzy-native.nvim'
    use 'digitaltoad/vim-pug'
    use {
        'kyazdani42/nvim-web-devicons',
        config = [[require'config.icon']],
        opt = true
    }
    use {
        'akinsho/nvim-bufferline.lua',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = [[require'bufferline'.setup {}]],
    }
    use {
        'glepnir/galaxyline.nvim',
        branch = 'main',
        config = [[require'config.statusline']],
    }
    use {
        'lewis6991/gitsigns.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = [[require'gitsigns'.setup {}]]
    }
    use {
         'neovim/nvim-lspconfig',
         requires = {'kabouzeid/nvim-lspinstall'}
    }
    use {
        'hrsh7th/nvim-compe',
        config = [[require'compe'.setup {}]]
    }
end)
