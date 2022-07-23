vim.o.termguicolors = true
vim.g.mapleader = ' '

--
-- Vim Options
--

-- Appearance
vim.o.number = true
vim.o.laststatus = 2
vim.o.hidden = true
vim.o.signcolumn = 'yes'

-- Tabs
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.copyindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2

-- Folding
vim.o.foldcolumn = '1'
vim.o.foldlevel = 90
vim.o.foldlevelstart = -1
vim.o.foldenable = true

-- Other
vim.o.encoding = 'UTF-8'
vim.o.hidden = true
vim.o.title = true
vim.wo.wrap = false
vim.o.titlestring = '%t - %m'

require('plugins')
require('keybinds');
