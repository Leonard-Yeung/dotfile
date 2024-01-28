return {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  dependencies = { "folke/trouble.nvim", "nvim-lua/plenary.nvim" },
  opst = function()
    local conf = require "plugins.configs.telescope"
    conf.defaults.mapping = {
      i = { ["<c-t>"] = require("trouble.providers.telescope").open_with_trouble },
      n = { ["<c-t>"] = require("trouble.providers.telescope").open_with_trouble },
    }
  end,
}
