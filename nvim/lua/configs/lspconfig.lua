-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "tsserver", "eslint", "terraformls", "jsonls", "yamlls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end
