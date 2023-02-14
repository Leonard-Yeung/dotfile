local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "c",
    "bash",
    "cmake",
    "cpp",
    "diff",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "graphql",
    "html",
    "jq",
    "json",
    "json5",
    "markdown",
    "python",
    "regex",
    "scala",
    "solidity",
    "sql",
    "svelte",
    "terraform",
    "typescript",
    "yaml"
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
    "cssmodules-language-server",
    "dockerfile-language-server",
    "eslint-lsp",
    "json-lsp",
    "luacheck",
    "luaformatter",
    "markdownlint",
    "prettier",
    "pylint",
    "python-lsp-server",
    "rust-analyzer",
    "rustfmt",
    "shellcheck",
    "shfmt",
    "solhint",
    "sqlls",
    "svelte-language-server",
    "terraform-ls",
    "vim-language-server",
    "yaml-language-server",
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

return M
