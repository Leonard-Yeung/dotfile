return {
  {
    "pmizio/typescript-tools.nvim",
    event = "LspAttach",
    ft = { "typescript", "typescriptreact" },
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
}
