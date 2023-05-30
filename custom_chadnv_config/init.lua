-- local autocmd = vim.api.nvim_create_autocmd
-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
vim.diagnostic.config {virtual_text = false}
vim.cmd [[
    set autoread
    augroup AutoRead
        autocmd!
        autocmd CursorHold * checktime
    augroup END
]]
