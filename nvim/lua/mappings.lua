require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>gt", "<cmd> tabnext <cr>", { desc = "Goto next tab" })
map("n", "<leader>gT", "<cmd> tabprevious <cr>", { desc = "Goto previous tab" })
map("n", "<leader>tk", "<cmd> Telescope keymaps <cr>", { desc = "Telescope keymaps" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
