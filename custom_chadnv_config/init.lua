-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

vim.o.guifont = "Hack Nerd Font Mono:h12"
vim.g.neovide_refresh_rate = 60
vim.g.neovide_cursor_animation_length = 0.05
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.g.neovide_cursor_vfx_mode = "pixiedust"
vim.cmd "set linebreak"
