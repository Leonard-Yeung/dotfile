local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    -- dependencies = {
    --   -- format & linting
    --   {
    --     "jose-elias-alvarez/null-ls.nvim",
    --     config = function()
    --       require "custom.configs.null-ls"
    --     end,
    --   },
    -- },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "mhartington/formatter.nvim",
    event = "BufEnter",
    config = function()
      local util = require "formatter.util"
      require("formatter").setup {
        -- Enable or disable logging
        logging = true,
        -- Set the log level
        log_level = vim.log.levels.WARN,
        -- All formatter configurations are opt-in
        filetype = {
          -- Formatter configurations for filetype "lua" go here
          -- and will be executed in order
          lua = {
            -- "formatter.filetypes.lua" defines default configurations for the
            -- "lua" filetype
            require("formatter.filetypes.lua").stylua,

            -- You can also define your own configuration
            -- function()
            --   -- Supports conditional formatting
            --   if util.get_current_buffer_file_name() == "special.lua" then
            --     return nil
            --   end
            --
            --   -- Full specification of configurations is down below and in Vim help
            --   -- files
            --   return {
            --     exe = "stylua",
            --     args = {
            --       "--search-parent-directories",
            --       "--stdin-filepath",
            --       util.escape_path(util.get_current_buffer_file_path()),
            --       "--",
            --       "-",
            --     },
            --     stdin = true,
            --   }
            -- end,
          },
          javascript = {
            require("formatter.filetypes.javascript").prettier,
          },
          typescript = {
            require("formatter.filetypes.typescript").prettier,
          },
          terraform = {
            require("formatter.filetypes.terraform").terraformfmt,
          },

          -- Use the special "*" filetype for defining formatter configurations on
          -- any filetype
          ["*"] = {
            -- "formatter.filetypes.any" defines default configurations for any
            -- filetype
            require("formatter.filetypes.any").remove_trailing_whitespace,
          },
        },
      }
      local augroup = vim.api.nvim_create_augroup
      local autocmd = vim.api.nvim_create_autocmd
      augroup("__formatter__", { clear = true })
      autocmd("BufWritePost", {
        group = "__formatter__",
        command = ":FormatWrite",
      })
    end,
  },

  {
    "ms-jpg/coq_nvim",
    url = "https://github.com/ms-jpq/coq_nvim.git",
    branch = "coq",
    event = "BufEnter",
    dependencies = {
      { "ms-jpq/coq.artifacts", branch = "artifacts" },
      { "ms-jpq/coq.thirdparty", branch = "3p" },
    },
  },

  {
    "andweeb/presence.nvim",
    enabled = false,
    event = "BufEnter",
    config = function()
      require("presence").setup()
    end,
  },

  {
    "ahmedkhalf/project.nvim",
    enabled = false,
    lazy = false,
    config = function()
      require("project_nvim").setup {}
      require("nvim-tree").setup {
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        update_focused_file = {
          enable = true,
          update_root = true,
        },
      }
      require("telescope").load_extension "projects"
      -- require("telescope").extensions.projects.projects {}
    end,
  },
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },
  -- Lua
  {
    "folke/zen-mode.nvim",
    event = "BufEnter",
    dependencies = {
      "folke/twilight.nvim",
    },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    config = function()
      require("zen-mode").setup {}
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    event = "BufEnter",
    config = function()
      require("gitsigns").setup {
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map("n", "]c", function()
            if vim.wo.diff then
              return "]c"
            end
            vim.schedule(function()
              gs.next_hunk()
            end)
            return "<Ignore>"
          end, { expr = true })

          map("n", "[c", function()
            if vim.wo.diff then
              return "[c"
            end
            vim.schedule(function()
              gs.prev_hunk()
            end)
            return "<Ignore>"
          end, { expr = true })

          -- Actions
          map("n", "<leader>hs", gs.stage_hunk)
          map("n", "<leader>hr", gs.reset_hunk)
          map("v", "<leader>hs", function()
            gs.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
          end)
          map("v", "<leader>hr", function()
            gs.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
          end)
          map("n", "<leader>hS", gs.stage_buffer)
          map("n", "<leader>hu", gs.undo_stage_hunk)
          map("n", "<leader>hR", gs.reset_buffer)
          map("n", "<leader>hp", gs.preview_hunk)
          map("n", "<leader>hb", function()
            gs.blame_line { full = true }
          end)
          map("n", "<leader>tb", gs.toggle_current_line_blame)
          map("n", "<leader>hd", gs.diffthis)
          map("n", "<leader>hD", function()
            gs.diffthis "~"
          end)
          map("n", "<leader>td", gs.toggle_deleted)

          -- Text object
          map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
        end,
      }
    end,
  },

  {
    "rcarriga/nvim-notify",
    lazy = false,
    config = function()
      vim.notify = require "notify"
    end,
  },

  {
    "folke/trouble.nvim",
    event = "BufEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    config = function()
      require("trouble").setup {
        opts,
        vim.keymap.set("n", "<leader>xx", function()
          require("trouble").toggle()
        end),
        vim.keymap.set("n", "<leader>xw", function()
          require("trouble").toggle "workspace_diagnostics"
        end),
        vim.keymap.set("n", "<leader>xd", function()
          require("trouble").toggle "document_diagnostics"
        end),
        vim.keymap.set("n", "<leader>xq", function()
          require("trouble").toggle "quickfix"
        end),
        vim.keymap.set("n", "<leader>xl", function()
          require("trouble").toggle "loclist"
        end),
        vim.keymap.set("n", "gR", function()
          require("trouble").toggle "lsp_references"
        end),
      }
      local actions = require "telescope.actions"
      local trouble = require "trouble.providers.telescope"

      local telescope = require "telescope"

      telescope.setup {
        defaults = {
          mappings = {
            i = { ["<c-t>"] = trouble.open_with_trouble },
            n = { ["<c-t>"] = trouble.open_with_trouble },
          },
        },
      }
    end,
  },
  {
    "folke/neodev.nvim",
    opts = {},
    event = "BufEnter",
    config = function()
      require("neodev").setup {}
    end,
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "BufEnter",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    config = function()
      require("todo-comments").setup {}
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "rmagatti/auto-session",
    lazy = false,
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      }
    end,
  },
  {
    "sindrets/diffview.nvim",
    event = "BufEnter",
    config = function()
      require("diffview").setup {}
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup {
        vim.keymap.set("n", "<leader>cK", "<cmd>Lspsaga hover_doc<CR>"),
        vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>"),
        vim.keymap.set("n", "<leader>ci", "<cmd>Lspsaga incoming_calls<CR>"),
        vim.keymap.set("n", "<leader>co", "<cmd>Lspsaga outgoing_calls<CR>"),
        vim.keymap.set("n", "<leader>cc", "<cmd>Lspsaga peek_definition<CR>"),
        vim.keymap.set("n", "<leader>cdn", "<cmd>Lspsaga diagnostic_jump_next<CR>"),
        vim.keymap.set("n", "<leader>cdp", "<cmd>Lspsaga diagnostic_jump_prev<CR>"),
        vim.keymap.set("n", "<leader>cf", "<cmd>Lspsaga finder<CR>"),
        vim.keymap.set("n", "<leader>cr", "<cmd>Lspsaga rename<CR>"),
      }
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons", -- optional
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    enabled = false,
  },
  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}
return plugins
