return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "eslint-lsp",
        "terraform-ls",
        "json-lsp",
        "yaml-language-server",
        "docker-compose-language-service",
        "ansible-language-server",
        "ansible-lint",
        "shellcheck",
        "shellharden",
        "standardrb",
        "shfmt",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "terraform",
        "json",
        "yaml",
        "dockerfile",
        "ruby",
        "bash",
      },
    },
  },
  { require "configs.cmp" },
  { require "configs.noice" },
  { require "configs.gitsigns" },
  { require "configs.lspsaga" },
  { require "configs.trouble" },
}
