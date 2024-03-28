local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
  "html",
  "cssls",
  "eslint",
  "tsserver",
  "clangd",
  "cmake",
  "dockerls",
  "jdtls",
  "jsonls",
  "lua_ls",
  "pyright",
  "solidity_ls_nomicfoundation",
  "yamlls",
  "terraformls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_init = function(client, _)
      if client.server_capabilities then
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.semanticTokensProvider = false -- turn off semantic tokens
      end
    end,
    on_attach = on_attach,
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  }
end

--
-- lspconfig.pyright.setup { blabla}
