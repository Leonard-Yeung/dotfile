return {
  "folke/trouble.nvim",
  opts = {},
  cmd = "Trouble",
  event = "LspAttach",
  keys = {
    {
      "<leader>tr",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
  }
}
