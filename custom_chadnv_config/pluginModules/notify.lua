local function notifySetup()
  vim.notify = require "notify"
end
return {
  "rcarriga/nvim-notify",
  lazy = false,
  config = function()
    require("notify").setup {
      notifySetup(),
    }
  end,
}
