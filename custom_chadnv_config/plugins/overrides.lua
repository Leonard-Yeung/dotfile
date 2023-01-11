local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "c",
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "angular-language-server",
    "bash-language-server",
    "clang-format",
    "clangd",
    "cmake-language-server",
    "cpplint",
    "cpptools",
    "cssmodules-language-server",
    "dockerfile-language-server",
    "eslint-lsp",
    "eslint_d",
    "json-lsp",
    "json-to-struct",
    "jsonlint",
    "luacheck",
    "luaformatter",
    "markdownlint",
    "prettier",
    "prettierd",
    "pylint",
    "python-lsp-server",
    "rust-analyzer",
    "rustfmt",
    "shellcheck",
    "shellharden",
    "shfmt",
    "solang",
    "solhint",
    "solidity",
    "solidity-ls",
    "sql-formatter",
    "sqlls",
    "svelte-language-server",
    "vim-language-server",
    "yaml-language-server",
    "yamlfmt",
    "yamllint"
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

eturn M
