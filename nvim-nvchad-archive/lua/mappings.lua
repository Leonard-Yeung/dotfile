require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>tn", ":tabnew<CR>", { desc = "Tabnew" })
map("n", "<leader>tk", ":Telescope keymaps<CR>", { desc = "Telescope keymaps" })
map("n", "<leader>gst", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle git blame line" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
