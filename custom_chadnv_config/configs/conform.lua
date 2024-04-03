local slow_format_filetypes = {}
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

  format_on_save = function(bufnr)
    if slow_format_filetypes[vim.bo[bufnr].filetype] then
      return
    end
    local function on_format(err)
      if err and err:match "timeout$" then
        slow_format_filetypes[vim.bo[bufnr].filetype] = true
      end
    end

    return { timeout_ms = 500, lsp_fallback = true }, on_format
  end,
  format_after_save = function(bufnr)
    if not slow_format_filetypes[vim.bo[bufnr].filetype] then
      return
    end
    return { lsp_fallback = true }
  end,
  -- formatters = {
  --   prettier = {
  --     command = "~/.config/yarn/global/node_modules/.bin/prettier",
  --   },
  -- },
}

require("conform").setup(options)
