return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = "*",
  opts = {
    ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
    provider = "claudeSonnet", -- Recommend using Claude
    auto_suggestions_provider = "claudeHaiku",
    ---@alias Tokenizer "tiktoken" | "hf"
    tokenizer = "tiktoken",
    system_prompt = [[
      Act as an expert software developer.
      Always use best practices when coding.
      Respect and use existing conventions, libraries, etc that are already present in the code base.
    ]],
    ---@type AvanteSupportedProvider
    openai = {
      endpoint = "https://api.openai.com/v1",
      model = "gpt-4o-mini",
      timeout = 5000, -- Timeout in milliseconds
      temperature = 0,
      max_tokens = 10000,
      ["local"] = false,
    },
    claude = {
      endpoint = "0.0.0.0",
      model = "claude-3-5-sonnet-20241022",
      temperature = 0,
      max_tokens = 4096,
    },
    vendors = {
      ---@type AvanteProvider
      ["claudeHaiku"] = { -- Cheaper model
        endpoint = "https://openrouter.ai/api/v1/chat/completions",
        model = "anthropic/claude-3-5-haiku",
        api_key_name = "OPENROUTER_API_KEY",
        timeout = 5000, -- Timeout in milliseconds
        temperature = 0,
        max_tokens = 8192,
        ---@type fun(opts: AvanteProvider, code_opts: AvantePromptOptions): AvanteCurlOutput
        parse_curl_args = function(opts, code_opts)
          return {
            url = opts.endpoint,
            headers = {
              ["Authorization"] = "Bearer " .. os.getenv(opts.api_key_name),
              ["Content-Type"] = "application/json",
              ["Accept"] = "application/json",
            },
            body = {
              model = opts.model,
              messages = { -- you can make your own message, but this is very advanced
                { role = "system", content = code_opts.system_prompt },
                { role = "user", content = require("avante.providers.claude").get_user_message(code_opts) },
              },
              temperature = opts.temperature,
              max_tokens = opts.max_tokens,
              stream = true, -- this will be set by default.
            },
          }
        end,
        ---@type fun(data_stream: string, event_state: string, opts: ResponseParser): nil
        parse_response_data = function(data_stream, event_state, opts)
          require("avante.providers").openai.parse_response(data_stream, event_state, opts)
        end,
        ["local"] = false,
      },
      ---@type AvanteProvider
      ["claudeSonnet"] = {
        endpoint = "https://openrouter.ai/api/v1/chat/completions",
        model = "anthropic/claude-3-5-sonnet",
        api_key_name = "OPENROUTER_API_KEY",
        timeout = 5000, -- Timeout in milliseconds
        temperature = 0,
        max_tokens = 6400,
        ---@type fun(opts: AvanteProvider, code_opts: AvantePromptOptions): AvanteCurlOutput
        parse_curl_args = function(opts, code_opts)
          return {
            url = opts.endpoint,
            headers = {
              ["Authorization"] = "Bearer " .. os.getenv(opts.api_key_name),
              ["Content-Type"] = "application/json",
              ["Accept"] = "application/json",
            },
            body = {
              model = opts.model,
              messages = { -- you can make your own message, but this is very advanced
                { role = "system", content = code_opts.system_prompt },
                { role = "user", content = require("avante.providers.claude").get_user_message(code_opts) },
              },
              temperature = opts.temperature,
              max_tokens = opts.max_tokens,
              stream = true, -- this will be set by default.
            },
          }
        end,
        ---@type fun(data_stream: string, event_state: string, opts: ResponseParser): nil
        parse_response_data = function(data_stream, event_state, opts)
          require("avante.providers").openai.parse_response(data_stream, event_state, opts)
        end,
        ["local"] = false,
      },
    },
    behaviour = {
      auto_suggestions = true, -- Experimental stage
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = false,
    },
    mappings = {
      --- @class AvanteConflictMappings
      diff = {
        ours = "co",
        theirs = "ct",
        all_theirs = "ca",
        both = "cb",
        cursor = "cc",
        next = "]x",
        prev = "[x",
      },
      suggestion = {
        accept = "<C-S-l>",
        next = "<C-S-]>",
        prev = "<C-S-[>",
        dismiss = "<C-S-]>",
      },
      jump = {
        next = "]]",
        prev = "[[",
      },
      submit = {
        normal = "<CR>",
        insert = "<C-s>",
      },
      sidebar = {
        apply_all = "A",
        apply_cursor = "a",
        switch_windows = "<Tab>",
        reverse_switch_windows = "<S-Tab>",
      },
    },
    hints = { enabled = true },
    windows = {
      ---@type "right" | "left" | "top" | "bottom"
      position = "right", -- the position of the sidebar
      wrap = true, -- similar to vim.o.wrap
      width = 30, -- default % based on available width
      sidebar_header = {
        enabled = true, -- true, false to enable/disable the header
        align = "center", -- left, center, right for title
        rounded = true,
      },
      input = {
        prefix = "> ",
      },
      edit = {
        border = "rounded",
        start_insert = true, -- Start insert mode when opening the edit window
      },
      ask = {
        floating = false, -- Open the 'AvanteAsk' prompt in a floating window
        start_insert = true, -- Start insert mode when opening the ask window, only effective if floating = true.
        border = "rounded",
      },
    },
    highlights = {
      ---@type AvanteConflictHighlights
      diff = {
        current = "DiffText",
        incoming = "DiffAdd",
      },
    },
    --- @class AvanteConflictUserConfig
    diff = {
      autojump = true,
      ---@type string | fun(): any
      list_opener = "copen",
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
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
    {
      "jackMort/ChatGPT.nvim",
      event = "VeryLazy",
      opts = {},
      dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "folke/trouble.nvim", -- optional
        "nvim-telescope/telescope.nvim",
      },
    },
  },
}
