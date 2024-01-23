local actions = require "telescope.actions"
local trouble = require "trouble.providers.telescope"
return {
  lazy = false,
  opts = {
    require "plugins.configs.telescope",
    defaults = {
      mappings = {
        i = { ["<c-t>"] = trouble.open_with_trouble },
        n = { ["<c-t>"] = trouble.open_with_trouble },
      },
    },
  },
}
