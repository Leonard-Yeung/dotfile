return {
  lazy = false,
  dependencies = {"folke/trouble"},
  opts = {
    require "plugins.configs.telescope",
    defaults = {
      mappings = {
        i = { ["<c-t>"] = require "trouble.providers.telescope".open_with_trouble },
        n = { ["<c-t>"] = require "trouble.providers.telescope".open_with_trouble },
      },
    },
  },
}
