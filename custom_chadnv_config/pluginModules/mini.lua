local miniSubmodule = { "surround", "ai", "files", "pick", "basics", "bracketed", "extra", "sessions" }
return {
  ---@type NvPluginSpec[]
  "echasnovski/mini.nvim",
  version = false,
  lazy = false,
  config = function()
    require("mini.surround").setup()
    -- require("mini.ai").setup()
    -- require("mini.files").setup()
    -- require("mini.pick").setup()
    require("mini.basics").setup()
    -- require("mini.bracketed").setup()
    require("mini.extra").setup()
    -- require("mini.sessions").setup()
  end,
}
