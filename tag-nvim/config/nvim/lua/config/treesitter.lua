require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
        enable = true,              -- false will disable the whole extension
        disable = {'pug'}
    },
    indent = {
        enable = true,
    },
    textobjects = {
        select = {
          enable = true,
          keymaps = {
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['aC'] = '@class.outer',
            ['iC'] = '@class.inner',
            ['ac'] = '@conditional.outer',
            ['ic'] = '@conditional.inner',
            ['ae'] = '@block.outer',
            ['ie'] = '@block.inner',
            ['al'] = '@loop.outer',
            ['il'] = '@loop.inner',
            ['is'] = '@statement.inner',
            ['as'] = '@statement.outer',
            ['ad'] = '@comment.outer',
            ['am'] = '@call.outer',
            ['im'] = '@call.inner'
          }
        }
    },
    playground = {
        enable = true,
    },
}
