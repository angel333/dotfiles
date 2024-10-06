-- docs here: ~/Documents/Obsidian_Vault/Tech/Vim.md

-- should be before any mapping
vim.g.mapleader = "<Space>"

require 'plugins'
require 'lsp'
require 'colors'

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false

-- usually per-file
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.opt.conceallevel = 2
vim.opt.foldtext = '' -- much less confusing folds
vim.opt.foldmethod = 'marker'

vim.opt.completeopt = 'menu,popup,longest'

-- <C-[hjkl]> navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")

-- vim:et:sw=2:ts=2:
