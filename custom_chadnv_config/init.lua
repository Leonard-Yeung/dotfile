local autocmd = vim.api.nvim_create_autocmd
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
-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
