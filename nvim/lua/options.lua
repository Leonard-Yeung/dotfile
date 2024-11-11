require "nvchad.options"

-- add yours here!

local o = vim.o
local g = vim.g
local opt = vim.opt
o.cursorlineopt = "both" -- to enable cursorline!
g.have_nerd_font = true
opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.showmode = true
vim.schedule(function()
  opt.clipboard = "unnamedplus"
end)
opt.breakindent = true
opt.undofile = true
opt.ignorecase = true
opt.smartcase = true
opt.signcolumn = "yes"
opt.updatetime = 250
opt.timeoutlen = 300
opt.splitright = true
opt.splitbelow = true
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.inccommand = "split"
opt.cursorline = true
opt.scrolloff = 30
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
opt.termguicolors = true
o.expandtab = true
o.smartindent = true
o.tabstop = 2
o.shiftwidth = 2
opt.guifont = "Hack Nerd Font:h12.5"
opt.wrap = true
opt.laststatus = 3

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true
})
