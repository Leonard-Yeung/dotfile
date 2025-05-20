require("nvchad.configs.lspconfig").defaults()
-- local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {
  "html",
  "cssls",
  "ansiblels",
  "dockerls",
  "docker_compose_language_service",
  "hyprls",
  "jsonls",
  "lua_ls",
  "nginx_language_server",
  "pyright",
  "tailwindcss",
  "terraformls",
  "yamlls",
}

-- NOT NEEDED SINCE NEOVIM 0.11
-- for _, server in ipairs(servers) do
--   require("lspconfig")[server].setup {
--     capabilities = capabilities,
--   }
-- end

vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
