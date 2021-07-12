-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
  false
)

local use = require('packer').use
require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'mattn/emmet-vim'
    use 'editorconfig/editorconfig-vim'
    use 'tpope/vim-surround'
    use 'Raimondi/delimitMate'
    use 'tomtom/tcomment_vim'
    use 'lukas-reineke/indent-blankline.nvim'
    use {
        'nvim-treesitter/nvim-treesitter',
        requires = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        run = ':TSUpdate'
    }
    use {
        'iamcco/markdown-preview.nvim',
        run = 'cd app && yarn install',
    }
    use 'dracula/vim'
    use 'norcalli/nvim-colorizer.lua'
    use 'kyazdani42/nvim-tree.lua'
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-fzy-native.nvim'},
        },
    }
    use 'digitaltoad/vim-pug'
    use 'kyazdani42/nvim-web-devicons'

    use {
        'akinsho/nvim-bufferline.lua',
        requires = {'kyazdani42/nvim-web-devicons'}
    }
    use {
        'glepnir/galaxyline.nvim',
        branch = 'main',
        requires = {'kyazdani42/nvim-web-devicons'}
    }
    use {
        'lewis6991/gitsigns.nvim',
        requires = {'nvim-lua/plenary.nvim'},
    }
    use 'neovim/nvim-lspconfig'
    use 'kabouzeid/nvim-lspinstall'
    use 'hrsh7th/nvim-compe'
    use 'hrsh7th/vim-vsnip'
    use 'kdheepak/lazygit.nvim'
end)

-- Disable some built-in plugins we don't want
local disabled_built_ins = {
  'gzip', 'man', 'matchit', 'matchparen', 'shada_plugin', 'tarPlugin', 'tar', 'zipPlugin', 'zip',
  'netrwPlugin'
}

for i = 1, 10 do vim.g['loaded_' .. disabled_built_ins[i]] = 1 end

vim.g.python_host_prog = '/usr/bin/python'
vim.g.python3_host_prog = '/usr/local/bin/python3'

local tabWidth = 2
vim.bo.expandtab = true
vim.bo.tabstop = tabWidth
vim.bo.softtabstop = tabWidth
vim.bo.shiftwidth = tabWidth
vim.bo.smartindent = true
vim.o.inccommand = 'nosplit'
vim.o.textwidth = 100
vim.o.scrolloff = 7
vim.o.hlsearch = false
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.wrap = false
vim.o.wildignore = '*.o,*~,*.pyc'
vim.o.hidden = true
vim.o.mouse = 'a'
vim.o.breakindent = true
vim.cmd [[set undofile]]
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes:1'
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.g.mapleader = ' '
vim.o.pumheight = 15
vim.o.splitright = true
vim.o.showmatch = true
vim.o.completeopt = 'menuone,noinsert'
vim.o.background = 'dark'
vim.o.termguicolors = true
vim.cmd [[colorscheme dracula]]

-- Gitsigns
require('gitsigns').setup {
    signs = {
        add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
        change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        delete       = {hl = 'GitSignsDelete', text = '│', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        topdelete    = {hl = 'GitSignsDelete', text = '│', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        changedelete = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
      },
}

-- Telescope
-- This will load fzy_native and have it override the default file sorter
require('telescope').load_extension('fzy_native')
require('telescope').setup {}
--Add leader shortcuts
vim.api.nvim_set_keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files({prompt_prefix=📂})<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fd', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fp', [[<cmd>lua require('telescope.builtin').live_grep({prompt_prefix=Aa})<CR>]], { noremap = true, silent = true })

-- Highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)

-- Y yank until the end of line
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })

-- LSP settings
local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

-- Configure lua language server for neovim development
local lua_settings = {
  Lua = {
    runtime = {
      -- LuaJIT in the case of Neovim
      version = "LuaJIT",
      path = vim.split(package.path, ";"),
    },
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = { "vim" },
    },
    workspace = {
      -- Make the server aware of Neovim runtime files
      library = {
        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
        [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
      },
    },
  },
}

-- config that activates keymaps and enables snippet support
local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return {
    -- enable snippet support
    capabilities = capabilities,
    -- map buffer local keybindings when the language server attaches
    on_attach = on_attach,
  }
end

-- lsp-install
local function setup_servers()
  require"lspinstall".setup()

  -- get all installed servers
  local servers = require"lspinstall".installed_servers()

  for _, server in pairs(servers) do
    local config = make_config()

    -- language specific config
    if server == "lua" then
      config.settings = lua_settings
      config.root_dir = function(fname)
        if fname:match("lush_theme") ~= nil then return nil end
        local util = require "lspconfig/util"
        return util.find_git_ancestor(fname) or util.path.dirname(fname)
      end
    end
    if server == "diagnosticls" then
      config = vim.tbl_extend("force", config, require "diagnosticls")
    end
    if server == "vim" then config.init_options = { isNeovim = true } end

    require"lspconfig"[server].setup(config)
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require"lspinstall".post_install_hook = function()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require('nvim-treesitter.configs').setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
}

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noinsert'

-- lazygit
vim.api.nvim_set_keymap('n', '<leader>lg', [[<cmd>LazyGit<cr>]], { noremap = true, silent = true })

-- Compe setup
require('compe').setup {
  source = {
    path = true,
    nvim_lsp = true,
    nvim_lua = true,
    buffer = true,
    vsnip = true,
    spell = true,
  },
}

-- Colorizer
require'colorizer'.setup (
    {'css'; 'html'; 'pug'; 'javascript'; 'javascriptreact'; 'less'},
    {css = true}
)

-- nvim-web-devicons
require'nvim-web-devicons'.setup {
  override = {
    pug = {
      icon = "",
      color = "#e34c26",
      name = "pug",
    }
  },
  default = true,
}

-- nvim-bufferline
vim.api.nvim_set_keymap('n', ']b', '<cmd>BufferLineCycleNext<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[b', '<cmd>BufferLineCyclePrev<cr>', { noremap = true, silent = true })

require('bufferline').setup{
    options = {
      modified_icon = '✥',
      buffer_close_icon = '',
      mappings = true,
      always_show_bufferline = true,
    }
}

-- nvim-tree
vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', { noremap = true, silent = true })
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_quit_on_open = 1

-- Map compe confirm and complete functions
vim.api.nvim_set_keymap('i', '<cr>', 'compe#confirm("<cr>")', { expr = true })
vim.api.nvim_set_keymap('i', '<c-space>', 'compe#complete()', { expr = true })

-- Window movement
vim.api.nvim_set_keymap('n', '<c-h>', '<c-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-j>', '<c-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-k>', '<c-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-l>', '<c-w>l', { noremap = true, silent = true })
