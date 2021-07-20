local util = require'lspconfig/util'
local prettier = {
  -- npm i -g prettier_d_slim
  formatCommand = "prettier_d_slim --stdin --stdin-filepath ${INPUT}",
  formatStdin = true
}

local eslint = {
  -- npm i -g eslint_d
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = { "%f(%l,%c): %tarning %m", "%f(%l,%c): %rror %m" }
}


local stylua = {
  -- cargo insatll stylua
  formatCommand = "stylua --stdin",
  formatStdin = true
}

local languages = {
  lua = { stylua },
  javascript = { prettier, eslint },
  javascriptreact = { prettier, eslint },
  typescript = { prettier, eslint },
  typescriptreact = { prettier, eslint },
  html = { prettier },
  css = { prettier },
  less = { prettier },
  yaml = { prettier },
  json = { prettier },
  markdown = { prettier },
}

return {
  filetypes = vim.tbl_keys(languages),
  init_options = { documentFormatting = true },
  settings = { rootMarkers = {".eslintrc.js",".eslintrc",".eslintrc.json", ".git"}, languages = languages },
  root_dir = function (fname)
        return util.root_pattern("tsconfig.json")(fname) or
          util.root_pattern(".eslintrc.js", ".eslintrc", ".eslintrc.json", ".git")(fname)
      end

}
