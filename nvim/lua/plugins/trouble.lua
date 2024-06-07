return {
  "folke/trouble.nvim",
  opts = {},
  cmd = "Trouble",
  event = "VeryLazy",
  keys = {
    {
      "<leader>tr",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
  }
}
