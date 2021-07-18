-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec([[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
  ]],
  false
)

local use = require('packer').use
require('packer').startup(function()
  use 'tweekmonster/startuptime.vim'
  use 'wbthomason/packer.nvim'
  use 'dracula/vim'
  use 'mattn/emmet-vim'
  use 'editorconfig/editorconfig-vim'
  use 'tpope/vim-surround'
  use 'windwp/nvim-autopairs'
  use 'glepnir/lspsaga.nvim'
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    run = ':TSUpdate'
  }
  use 'b3nj5m1n/kommentary'
  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && yarn install',
  }
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
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'},
  }
  use 'neovim/nvim-lspconfig'
  use 'kabouzeid/nvim-lspinstall'
  use 'hrsh7th/nvim-compe'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
end)

-- Disable some built-in plugins we don't want
local disabled_built_ins = {
  'gzip', 'man', 'matchit', 'matchparen', 'shada_plugin', 'tarPlugin', 'tar', 'zipPlugin', 'zip',
  'netrwPlugin'
}

for i = 1, 10 do vim.g['loaded_' .. disabled_built_ins[i]] = 1 end

vim.g.python_host_prog = '/usr/bin/python'
vim.g.python3_host_prog = '/usr/local/bin/python3'

-- tab config
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.shiftround = true
vim.opt.inccommand = 'nosplit'
vim.opt.textwidth = 80
-- list chars
vim.opt.list = true
vim.opt.listchars = "tab:»·,space:⋅,trail:+,extends:→,precedes:←"
-- lines below cursor
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5
-- better searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
-- number display in .opt.umn
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.wildignore = '*.o,*~,*.pyc'
-- switch buffer wit.opt.t saving them
vim.opt.hidden = true
vim.opt.mouse = 'nv'
vim.opt.breakindent = true
vim.cmd [[set undofile]]
vim.opt.updatetime = 250
vim.opt.signcolumn = 'yes:1'
vim.opt.shortmess = vim.o.shortmess .. 'c'
-- Leader key
vim.g.mapleader = ' '
vim.opt.pumheight = 10
-- split in rea.opt.able positions
vim.opt.splitright = true
vim.opt.splitbelow = true
-- matching parenthesis
vim.opt.showmatch = true
-- fold
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevelstart = 99
vim.opt.completeopt = 'menuone,noselect,noinsert'
-- colorscheme settings
vim.opt.background = 'dark'
vim.opt.termguicolors = true
vim.cmd[[colorscheme dracula]]

-- Kcommentary
require('kommentary.config').configure_language("default", {
  prefer_single_line_comments = true,
})

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
require('telescope').setup {
  defaults = {
    prompt_prefix = '🔭 ',
    selection_caret = " ",
  }
}
--Add leader shortcuts
vim.api.nvim_set_keymap('n', '<leader>bb', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files({prompt_prefix=📂})<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fd', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true, silent = true })

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

-- LSP settings
local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap = true, silent = true }
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
  -- vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
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
  highlight = { enable = true },
  indent = { enable = true },
  autopairs = { enable = true },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@conditional.outer',
        ['ic'] = '@conditional.inner',
      },
    },
  },
}

-- Nvim-autopairs
require('nvim-autopairs').setup()
require("nvim-autopairs.completion.compe").setup({
  map_cr = true, --  map <CR> on insert mode
})

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
    return t "<Plug>(vsnip-expand-or-jump)"
  else
    return t "<Tab>"
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn['vsnip#jumpable'](-1) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

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

-- Nvim-colorizer
require'colorizer'.setup ({
  css = {
    css = true
  },
  'html',
  'pug',
  'javascript',
  'javascriptreact',
  'less'
})

-- Nvim-web-devicons
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

-- Nvim-tree
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_hide_dotfiles = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_bindings = {
  { key =  "e", cb = tree_cb("edit") },
  { key =  "v", cb = tree_cb("vsplit") },
  { key =  "i", cb = tree_cb("split") },
}
vim.g.nvim_tree_icons = {
  default =  '',
  symlink =  '',
}
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })


-- Window movement
vim.api.nvim_set_keymap('n', '<c-h>', '<c-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-j>', '<c-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-k>', '<c-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-l>', '<c-w>l', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'H', '<cmd>vertical resize -10<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'L', '<cmd>vertical resize +10<CR>', { noremap = true, silent = true })


-- Emmet settings
vim.g.user_emmet_complete_tag = 0
vim.g.user_emmet_install_global = 0
vim.g.user_emmet_install_command = 0
vim.g.user_emmet_mode = 'i'
vim.g.user_emmet_settings = {
  javascript = {
    extends = 'jsx'
  },
  typescript = {
    extends = 'jsx'
  },
}
vim.cmd [[autocmd FileType html,css,javascript,typescript,javascriptreact,typescriptreact EmmetInstall]]

-- Statusline settings
function CurrentLsp()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then return msg end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
end

require'lualine'.setup {
  options = {
    theme = "dracula",
    component_separators = "",
    section_separators = "",
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'filename'},
    lualine_c = {'branch', 'diff', },
    lualine_x = {
      {CurrentLsp, icon = ' LSP:'},
      {
        'diagnostics',
        sources = {'nvim_lsp'},
      },
      'fileformat',
      {'o:encoding', upper = true }
    },
    lualine_y = {'filetype'},
    lualine_z = {'location', 'progress'},
  },
  tabline = {
    lualine_a = {"filename"},
  }
}

-- Terminal
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map('t', '<ESC>', [[<C-\><C-n>]], opts)
map('n', '<leader>nt', [[<CMD>tabnew | term<CR>]], opts)
map('n', '<leader>lg', [[<CMD>tabnew | term lazygit<CR>]], opts)

-- Lspsaga
require'lspsaga'.init_lsp_saga{
  code_action_prompt = {
    virtual_text = false,
  },
  max_preview_lines = 20,
}

vim.api.nvim_set_keymap('n', 'gh', [[<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ca', [[<cmd>lua require('lspsaga.codeaction').code_action()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>ca', [[<cmd><C-U>lua require('lspsaga.codeaction').code_action()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'K', [[<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-f>', [[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-b>', [[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gp', [[<cmd>lua require'lspsaga.provider'.preview_definition()<CR>]], { noremap = true, silent = true })
