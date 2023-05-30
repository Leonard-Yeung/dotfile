local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

    -- Override plugin definition options

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            -- format & linting
            {
                "jose-elias-alvarez/null-ls.nvim",
                config = function()
                    require "custom.configs.null-ls"
                end
            }
        },
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end -- Override to setup mason-lspconfig
    }, -- override plugin configs
    {"williamboman/mason.nvim", opts = overrides.mason},

    {"nvim-treesitter/nvim-treesitter", opts = overrides.treesitter}, {
        "nvim-tree/nvim-tree.lua",
        opts = overrides.nvimtree,
        config = function()
            require("nvim-tree").setup {
                sync_root_with_cwd = true,
                respect_buf_cwd = true,
                update_focused_file = {enable = true, update_root = true}
            }
        end
    }, -- Install a plugin
    {
        "max397574/better-escape.nvim",
        event = "InsertEnter",
        config = function() require("better_escape").setup() end
    }, {
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        build = function() vim.fn["mkdp#util#install"]() end
    }, {
        "ojroques/nvim-lspfuzzy",
        dependencies = {"junegunn/fzf", "junegunn/fzf.vim"},
        config = function() require("lspfuzzy").setup {} end
    }, {"weilbith/nvim-code-action-menu", cmd = "CodeActionMenu"}, {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        lazy = false,
        config = function() require("lsp_lines").setup() end
    }, {
        "rest-nvim/rest.nvim",
        dependencies = {"nvim-lua/plenary.nvim"},
        config = function()
            require("rest-nvim").setup {
                -- Open request results in a horizontal split
                result_split_horizontal = false,
                -- Keep the http file buffer above|left when split horizontal|vertical
                result_split_in_place = false,
                -- Skip SSL verification, useful for unknown certificates
                skip_ssl_verification = false,
                -- Encode URL before making request
                encode_url = true,
                -- Highlight request on run
                highlight = {enabled = true, timeout = 150},
                result = {
                    -- toggle showing URL, HTTP info, headers at top the of result window
                    show_url = true,
                    show_http_info = true,
                    show_headers = true,
                    -- executables or functions for formatting response body [optional]
                    -- set them to false if you want to disable them
                    formatters = {
                        json = "jq",
                        html = function(body)
                            return vim.fn
                                       .system({"tidy", "-i", "-q", "-"}, body)
                        end
                    }
                },
                -- Jump to request line on run
                jump_to_request = false,
                env_file = ".env",
                custom_dynamic_variables = {},
                yank_dry_run = true
            }
        end
    }, {
        "ahmedkhalf/project.nvim",
        lazy = false,
        config = function()
            require("project_nvim").setup {
                require("telescope").load_extension "projects"
            }
        end
    }
    -- {"hrsh7th/cmp-nvim-lsp"}, {"hrsh7th/cmp-buffer"}, {"hrsh7th/cmp-path"},
    -- {"hrsh7th/cmp-cmdline"}, {"hrsh7th/nvim-cmp"}, {"saadparwaiz1/cmp_luasnip"}
    -- To make a plugin not be loaded
    -- {
    --   "NvChad/nvim-colorizer.lua",
    --   enabled = false
    -- },

    -- All NvChad plugins are lazy-loaded by default
    -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
    -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
    -- {
    --   "mg979/vim-visual-multi",
    --   lazy = false,
    -- }
}

return plugins
