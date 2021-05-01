local telescope = require'telescope'
local utils = require'config.utils'
local map = utils.map

map('n', '<leader>ff', '<cmd>Telescope find_files prompt_prefix=📂<cr>')
map('n', '<leader>fg', '<cmd>Telescope live_grep prompt_prefix=🔍<cr>')

telescope.setup {
    defaults = {
        file_sorter =  require'telescope.sorters'.get_fzy_sorter,
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}

telescope.load_extension('fzy_native')
