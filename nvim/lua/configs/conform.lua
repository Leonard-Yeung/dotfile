local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    yaml = { "prettier" },
    json = { "prettier" },
    ruby = { "standardrb" },
    sh = { "shfmt" },
  },
  format_after_save = {
    lsp_format = "fallback",
  },
}

require("conform").setup(options)
