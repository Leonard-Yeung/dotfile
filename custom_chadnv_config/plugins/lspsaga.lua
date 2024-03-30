return {
  "nvimdev/lspsaga.nvim",
  config = function()
    require("lspsaga").setup {}
  end,
  init = function()
    vim.keymap.set("n", "<leader>csi", ":Lspsaga incoming_calls", { desc = "Lspsaga Call Hierarachy Incoming" })
    vim.keymap.set("n", "<leader>cso", ":Lspsaga outgoing_calls", { desc = "Lspsaga Call Hierarachy Outgoing" })
    vim.keymap.set("n", "<leader>csd", ":Lspsaga peek_definition", { desc = "Lspsaga Peek Definition" })
    vim.keymap.set("n", "<leader>csgd", ":Lspsaga goto_definition", { desc = "Lspsaga Goto Definition" })
    vim.keymap.set("n", "<leader>csn", ":Lspsaga diagnostic_jump_next", { desc = "Lspsaga Jump to Next Diagnostic" })
    vim.keymap.set(
      "n",
      "<leader>csn",
      ":Lspsaga diagnostic_jump_prev",
      { desc = "Lspsaga Jump to Previous Diagnostic" }
    )
    vim.keymap.set("n", "<leader>csf", ":Lspsaga finder", { desc = "Lspsaga Finder" })
    vim.keymap.set("n", "<leader>cst", ":Lspsaga term_toggle", { desc = "Lspsaga Float Terminal" })
    vim.keymap.set("n", "K", ":Lspsaga hover_doc", { desc = "Lspsaga Hover Doc" })
    vim.keymap.set("n", "<leader>csr", ":Lspsaga rename ++project", { desc = "Lspsaga Project Rename" })
    vim.keymap.set("n", "<leader>csR", ":Lspsaga rename", { desc = "Lspsaga Rename" })
  end,
  event = "LspAttach",
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons", -- optional
  },
}
