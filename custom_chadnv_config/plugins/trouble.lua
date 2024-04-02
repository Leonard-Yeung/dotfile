return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  event = "BufEnter",
  init = function()
    vim.keymap.set("n", "<leader>xx", ":TroubleToggle <cr>", { desc = "Toggle Trouble" })
  end,
}
