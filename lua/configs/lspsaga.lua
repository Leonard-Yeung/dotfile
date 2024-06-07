return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  config = function()
    require("lspsaga").setup {}
    local map = vim.keymap.set
    map("n", "<leader>lca", ":Lspsaga code_action <cr>", { desc = "Lspsaga Code Action" })
    map("n", "<leader>lpd", ":Lspsaga peek_defintion <cr>", { desc = "Lspsaga Peek Definition" })
    map("n", "<leader>lf", ":Lspsaga finder <cr>", { desc = "Lspsaga Finder" })
    map("n", "<leader>lrn", ":Lspsaga rename <cr>", { desc = "Lspsaga Rename" })
    map("n", "<leader>llr", ":Lspsaga lsp_rename ++project <cr>", { desc = "Lspsaga LSP Rename" })
    map("n", "<leader>lpr", ":Lspsaga project_replace <cr>", { desc = "Lspsaga Project Rename" })
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons", -- optional
  },
}
