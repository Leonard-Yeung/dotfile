local options = {
  lsp_fallback = true,

  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    sh = { "shfmt" },
    terraform = { "terraform_fmt" },
    yaml = { "prettier" },
    json = { "prettier" },
    java = { "google-java-format" },
  },

  -- adding same formatter for multiple filetypes can look too much work for some
  -- instead of the above code you could just use a loop! the config is just a table after all!

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 5000,
    lsp_fallback = true,
  },

  -- formatters = {
  --   prettier = {
  --     command = "~/.config/yarn/global/node_modules/.bin/prettier",
  --   },
  -- },
}

require("conform").setup(options)
