local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local coq = require "coq"

-- if you just want default config for the servers then put them in a table
local servers = {
  "html",
  "cssls",
  "tsserver",
  "eslint",
  "clangd",
  "cmake",
  "dockerls",
  "jsonls",
  "lua_ls",
  "pyright",
  "solidity",
  "yamlls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    coq.lsp_ensure_capabilities {
      on_attach = on_attach,
      capabilities = capabilities,
    },
  }
end

--
-- lspconfig.pyright.setup { blabla}
