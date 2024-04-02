return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  event = { "BufEnter *.md", "BufEnter *.html" },
  build = "cd app && yarn install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
    vim.keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle <cr>", { desc = "Toggle Markdown Preview" })
  end,
  ft = { "markdown" },
}
