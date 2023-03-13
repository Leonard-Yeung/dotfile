local autocmd = vim.api.nvim_create_autocmd
print("HELLO WTFFFFFFFF")
vim.opt.autoread = true
vim.opt.guifont = "Hack Nerd Font Mono:h11"
vim.opt.breakindent = true
vim.opt.linebreak = true
vim.opt.wrap = true
vim.opt.wrapscan = true
vim.opt.wildmode="list:longest"
vim.opt.nocompatible = true
vim.opt.filetype = "on"
vim.opt.syntax = "on"
vim.g.lichess_api_token = "lip_g40caEVn55D4SGJvtgNc"
vim.g.lichess_autoqueen = 1
vim.g.lichess_time = 15
vim.g.lichess_increment = 5
vim.g.lichess_rated = 1
vim.g.lichess_variant = "standard"
vim.g.lichess_color = "random"
vim.g.lichess_debug_level = 2
-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
