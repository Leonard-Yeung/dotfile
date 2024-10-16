local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    dockerfile = { "prettier" },
  },

  format_after_save = {
    async = true,
    lsp_fallback = true,
  },
  default_format_opts = {
    async = true,
    lsp_fallback = true,
  },
}

return options
