require "nvchad.options"

-- add yours here!
vim.g.neovide_cursor_animation_length = 0.05
vim.opt.termguicolors = true
vim.g.neovide_cursor_vfx_mode = "pixiedust"
vim.g.neovide_remember_window_size = true
vim.cmd "set linebreak"
vim.opt.spell = true
vim.opt.spelllang = { "en_us" }

if vim.fn.has "mac" then
  vim.o.guifont = "Hack Nerd Font Mono:h12"
  vim.g.neovide_refresh_rate = 60
else
  vim.o.guifont = "Hack Nerd Font Mono:h14"
  vim.g.neovide_refresh_rate = 144
end
-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
