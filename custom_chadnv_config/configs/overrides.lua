local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "bash",
    "cmake",
    "cpp",
    "comment",
    "diff",
    "dockerfile",
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "go",
    "graphql",
    "java",
    "json",
    "json5",
    "jsdoc",
    "luadoc",
    "php",
    "phpdoc",
    "python",
    "regex",
    "rust",
    "scala",
    "solidity",
    "sql",
    "swift",
    "terraform",
    "toml",
    "vimdoc",
    "yaml"
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
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
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    "angular-language-server",
    "asm-lsp",
    "bash-language-server",
    "cmake-language-server",
    "cpplint",
    "cssmodules-language-server",
    "dockerfile-language-server",
    "eslint-lsp",
    "htmlbeautifier",
    "java-language-server",
    "json-lsp",
    "luacheck",
    "luaformatter",
    "markdownlint",
    "pylint",
    "shellcheck",
    "solang",
    "solidity",
    "svelte-language-server",
    "terraform-ls",
    "yaml-language-server"
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
