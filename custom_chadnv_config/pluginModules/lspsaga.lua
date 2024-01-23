return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  config = function()
    require("lspsaga").setup {
      vim.keymap.set("n", "<leader>cK", "<cmd>Lspsaga hover_doc<CR>"),
      vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>"),
      vim.keymap.set("n", "<leader>ci", "<cmd>Lspsaga incoming_calls<CR>"),
      vim.keymap.set("n", "<leader>co", "<cmd>Lspsaga outgoing_calls<CR>"),
      vim.keymap.set("n", "<leader>cc", "<cmd>Lspsaga peek_definition<CR>"),
      vim.keymap.set("n", "<leader>cdn", "<cmd>Lspsaga diagnostic_jump_next<CR>"),
      vim.keymap.set("n", "<leader>cdp", "<cmd>Lspsaga diagnostic_jump_prev<CR>"),
      vim.keymap.set("n", "<leader>cf", "<cmd>Lspsaga finder<CR>"),
      vim.keymap.set("n", "<leader>cr", "<cmd>Lspsaga rename<CR>"),
      code_action = {
        extends_gitsigns = true,
      },
    }
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons", -- optional
  },
}
