vim.o.termguicolors = true
vim.g.mapleader = ' '

require('plugins')
require('pluginsettings')

--
-- Vim Options
--

-- Appearance
vim.o.number = true
vim.o.laststatus = 2
vim.o.hidden = true

-- Tabs
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.copyindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2

-- Other
vim.o.encoding = 'UTF-8'
vim.o.hidden = true
vim.o.completeopt = "menuone,noinsert,noselect"
