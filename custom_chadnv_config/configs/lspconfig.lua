-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
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

-- lsps with default config
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		on_init = on_init,
		capabilities = capabilities,
	})
end

-- typescript
lspconfig.tsserver.setup({
	on_attach = on_attach,
	on_init = on_init,
	capabilities = capabilities,
})
