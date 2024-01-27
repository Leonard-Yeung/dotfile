return {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  dependencies = { "folke/trouble.nvim", "nvim-lua/plenary.nvim" },
  config = function()
    require "plugins.configs.telescope"
    require("telescope").setup {
      defaults = {
        mappings = {
          i = { ["<c-t>"] = require("trouble.providers.telescope").open_with_trouble },
          n = { ["<c-t>"] = require("trouble.providers.telescope").open_with_trouble },
        },
      },
    }
  end,
}
