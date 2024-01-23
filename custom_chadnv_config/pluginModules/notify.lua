return {
  "rcarriga/nvim-notify",
  lazy = false,
  opts = {
    function()
      vim.notify = require "notify"
    end,
  },
}
