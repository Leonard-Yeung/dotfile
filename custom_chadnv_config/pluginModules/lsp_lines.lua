return {
  -- "~whynothugo/lsp_lines",
  url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  event = "BufEnter",
  config = function()
    require("lsp_lines").setup {
      vim.diagnostic.config { virtual_text = true },
      vim.diagnostic.config { virtual_lines = false },
      vim.keymap.set("n", "<Leader>ll", function()
        vim.diagnostic.config { virtual_text = false }
        vim.diagnostic.config { virtual_lines = true }
      end, { desc = "Enable lsp_lines" }),
      vim.keymap.set("n", "<Leader>ln", function()
        vim.diagnostic.config { virtual_text = true }
        vim.diagnostic.config { virtual_lines = false }
      end, { desc = "Rollback lsp_lines" }),
    }
  end,
}
