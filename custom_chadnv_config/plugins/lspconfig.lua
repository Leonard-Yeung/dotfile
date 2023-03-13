local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = {
  "angularls",
  "bashls",
  "clangd",
  "cssls",
  -- "cssmodules_ls",
  "dockerls",
  "eslint",
  "graphql",
  "java_language_server",
  "html",
  "jqls",
  "jsonls",
  "metals",
  "pylsp",
  -- "pyright",
  "rls",
  "rust_analyzer",
  "solidity_ls",
  "sqls",
  "svelte",
  "syntax_tree",
  "terraformls",
  "tsserver",
  "vimls",
  "vuels",
  "yamlls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup { on_attach = on_attach, capabilities = capabilities }
end
