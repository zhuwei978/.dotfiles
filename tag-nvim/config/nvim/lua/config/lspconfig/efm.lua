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

local vint = {
  -- brew install vint --HEAD
  lintCommand = "vint -f '{file_path}:{line_number}:{column_number}: {severity}: {description} (see: {reference})' --enable-neovim -",
  -- stdin needs vint >= 0.4
  lintStdin = true,
  lintFormats = { "%f:%l:%c: %trror: %m", "%f:%l:%c: %tarning: %m" }
}

-- brew install yamllint
local yamllint = { lintCommand = "yamllint -f parsable -", lintStdin = true }

local languages = {
  lua = { stylua },
  javascript = { prettier, eslint },
  javascriptreact = { prettier, eslint },
  typescript = { prettier, eslint },
  typescriptreact = { prettier, eslint },
  html = { prettier },
  css = { prettier },
  vim = { vint },
  yaml = { yamllint, prettier },
  json = { prettier }
}

return {
  filetypes = vim.tbl_keys(languages),
  init_options = { documentFormatting = true },
  settings = { rootMarkers = { ".git/" }, languages = languages }
}
