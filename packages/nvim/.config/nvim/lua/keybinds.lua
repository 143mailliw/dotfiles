local wk = require('whichkey_setup');

local keymap = {
  b = {
    name = "buffers",
    n = {"<Cmd>enew<CR>", "new"},
    v = {"<Cmd>vnew<CR>", "vertical new"},
    d = {"<Cmd>silent! bdelete<CR>", "delete"},
    f = {"<Cmd>Telescope buffers<CR>", "buffers"},
    a = {"<Cmd>wall<CR>", "write all"}
  },
  f = {
    name = "find",
    f = {"<Cmd>Telescope find_files<CR>", "files"},
    g = {"<Cmd>Telescope live_grep<CR>", "grep"},
    b = {"<Cmd>Telescope buffers<CR>", "buffers"},
    h = {"<Cmd>Telescope help_tags<CR>", "help tags"},
    r = {"<Cmd>Telescope oldfiles<CR>", "recent"}
  },
  g = {
    name = "go to",
    r = {"<Cmd>Trouble lsp_references<CR>", "references"},
    d = {"<Cmd>Trouble lsp_definitions<CR>", "definitions"},
    w = {"<Cmd>Trouble lsp_workspace_diagnostics<CR>", "workspace diag"},
    o = {"<Cmd>Trouble lsp_document_diagnostics<CR>", "document diag"},
    t = {"<Cmd>Telescope<CR>", "telescope"},
    a = {"<Cmd>Telescope lsp_code_actions<CR>", "actions"},
    i = {"<Cmd>Telescope lsp_implementations<CR>", "implementations"},
    b = {"<Cmd>FloatermNew ranger<CR>", "ranger"},
  },
  v = {
    name = "version control",
    l = {"<Cmd>LazyGit<CR>", "lazygit"},
    s = {"<Cmd>Telescope git_status<CR>", "status"}
  },
  n = {
    name = "neovim",
    c = {"<Cmd>cd ~/.config/nvim<CR>", "go to config"},
    s = {"<Cmd>PackerSync<CR>", "packer sync"},
    l = {"<Cmd>LspInstallInfo<CR>", "lsp installer"},
    i = {"<Cmd>LuaCacheLog<CR>", "impatient"},
    h = {"<Cmd>HardTimeToggle<CR>", "hardtime"}
  },
  a = {
    name = "appearence",
    t = {"<Cmd>Twilight<CR>", "twilight"},
  }
}

wk.register_keymap('leader', keymap)

-- Buffer switching
vim.api.nvim_set_keymap('n', '<Tab>', '<Cmd>bnext<CR>', { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', '<S-Tab>', '<Cmd>bprevious<CR>', { noremap = true, silent = true })
