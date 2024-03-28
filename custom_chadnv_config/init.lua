-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- "VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- }

vim.o.guifont = "Hack Nerd Font Mono:h10"
vim.g.neovide_refresh_rate = 144
vim.g.neovide_cursor_animation_length = 0.05
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
-- vim.g.loaded_netrwSettings = 1
-- vim.g.loaded_netrwFileHandlers = 1
vim.opt.termguicolors = true
vim.g.neovide_cursor_vfx_mode = "pixiedust"
vim.g.neovide_remember_window_size = true
vim.cmd "set linebreak"
-- vim.cmd "set nocp"
-- vim.cmd "filetype plugin on"
