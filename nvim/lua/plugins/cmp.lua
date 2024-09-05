return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/nvim-cmp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "amarakon/nvim-cmp-buffer-lines",
      "windwp/nvim-autopairs",
      "David-Kunz/cmp-npm",
    },
    event = { "LspAttach" },
    config = function()
      local cmp = require "cmp"
      local luasnip = require "luasnip"
      -- local cmp_autopairs = require "nvim-autopairs.completion.cmp"
      -- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
      cmp.setup {
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = {
          ["<C-c>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              if luasnip.expandable() then
                luasnip.expand()
              else
                cmp.confirm {
                  select = false,
                }
              end
            else
              fallback()
            end
          end),

          ["<C-n>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.locally_jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<C-p>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        },
        sources = {
          { name = "luasnip" },
          {
            name = "buffer",
            option = {
              get_bufnrs = function()
                return vim.api.nvim_list_bufs()
              end,
              keyword_length = 1,
            },
          },
          { name = "nvim_lsp" },
          { name = "path" },
          {
            name = "bufname",
            option = {
              current_buf_only = false,
              bufs = function()
                return vim.api.nvim_list_bufs()
              end,
            },
          },
          { name = "nvim_lsp_signature_help" },
          {
            name = "spell",
            option = {
              keep_all_entries = false,
              enable_in_context = function()
                return true
              end,
              preselect_correct_word = true,
            },
          },
        },
      }
      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources {
          { name = "buffer" },
          { name = "nvim_lsp_document_symbol" },
        },
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources {
          { name = "path" },
          { name = "cmdline" },
        },
        matching = { disallow_symbol_nonprefix_matching = false },
      })
      -- require "configs.lspconfig"
    end,
  },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  { "tzachar/cmp-fuzzy-path", dependencies = { "hrsh7th/nvim-cmp", "tzachar/fuzzy.nvim" } },
  {
    "David-Kunz/cmp-npm",
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = "json",
    config = function()
      require("cmp-npm").setup {}
    end,
  },
}
