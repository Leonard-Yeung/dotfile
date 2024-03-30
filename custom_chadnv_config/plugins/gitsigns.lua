return {
  "lewis6991/gitsigns.nvim",
  event = "BufEnter",
  opts = {
    current_line_blame = true,
  },
  init = function()
    vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame", { desc = "Toggle Current Line Git Blame" })
  end,
}
