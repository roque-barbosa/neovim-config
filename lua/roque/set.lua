-- disable netrw at the very start of your init.lua
--vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


vim.opt.clipboard = 'unnamedplus'

vim.opt.nu = true
vim.opt.relativenumber = false

vim.bo.autoindent = true
vim.opt.smartindent = true

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.go.smarttab = true
vim.o.softtabstop = 2
vim.o.expandtab = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50
