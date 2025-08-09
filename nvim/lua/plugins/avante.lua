return {
  "yetone/avante.nvim",
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  -- ⚠️ must add this setting! ! !
  build = vim.fn.has "win32" ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
    or "make",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  ---@module 'avante'
  ---@type avante.Config
  opts = {
    -- add any opts here
    provider = "openrouter_gemini_pro",
    providers = {
      openrouter_gemini_pro = {
        __inherited_from = "openai",
        api_key_name = "OPENROUTER_API_KEY",
        model = "google/gemini-2.5-pro",
        endpoint = "https://openrouter.ai/api/v1",
        extra_request_body = {
          temperature = 0.1,
          max_tokens = 100000,
        },
      },
      openrouter_gemini_flash = {
        __inherited_from = "openai",
        api_key_name = "OPENROUTER_API_KEY",
        model = "google/gemini-2.5-flash",
        endpoint = "https://openrouter.ai/api/v1",
        extra_request_body = {
          temperature = 0.1,
          max_tokens = 100000,
        },
      },
      openrouter_sonnet = {
        __inherited_from = "openai",
        api_key_name = "OPENROUTER_API_KEY",
        model = "anthropic/claude-sonnet-4",
        endpoint = "https://openrouter.ai/api/v1",
        extra_request_body = {
          temperature = 0.1,
          max_tokens = 100000,
        },
      },
    },
    selector = {
      --- @alias avante.SelectorProvider "native" | "fzf_lua" | "mini_pick" | "snacks" | "telescope" | fun(selector: avante.ui.Selector): nil
      --- @type avante.SelectorProvider
      provider = "fzf",
      -- Options override for custom providers
      provider_opts = {},
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "echasnovski/mini.pick", -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
    "stevearc/dressing.nvim", -- for input provider dressing
    "folke/snacks.nvim", -- for input provider snacks
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
