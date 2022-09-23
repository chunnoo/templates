-- Basic options
vim.o.encoding = "utf-8"

vim.o.number = true
vim.o.relativenumber = true
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true

vim.o.updatetime = 50

vim.o.signcolumn = "yes"
vim.o.hlsearch = false

vim.o.hidden = true
vim.o.swapfile = false

vim.o.exrc = true
vim.o.secure = true

vim.o.cursorline = true
vim.o.scrolloff = 8

vim.o.foldnestmax = 0
vim.o.foldlevelstart = 99

vim.opt.colorcolumn:append("120")

-- vim.opt.list = true
vim.opt.listchars:append({eol = '┐', space = '.'})
