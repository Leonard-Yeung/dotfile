return {
  url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  event = "LspAttach",
  opts = {},
  init = function()
    vim.keymap.set("n", "<leader>ll", function()
      vim.diagnostic.config { virtual_lines = true }
    end, { desc = "Enable lsp_lines" })
    vim.keymap.set("n", "<leader>ln", function()
      vim.diagnostic.config { virtual_lines = false }
    end, { desc = "Disable lsp_lines" })
    vim.diagnostic.config { virtual_lines = false }
  end,
}
