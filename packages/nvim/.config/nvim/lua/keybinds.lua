local wk = require('whichkey_setup');

local keymap = {
  b = {
    name = "buffers",
    n = {"<Cmd>new<CR>", "new"},
    v = {"<Cmd>vnew<CR>", "vertical new"},
    d = {"<Cmd>bdelete<CR>", "delete"},
    f = {"<Cmd>Telescope buffers<CR>", "buffers"}
  },
  f = {
    name = "find",
    f = {"<Cmd>Telescope find_files<CR>", "files"},
    g = {"<Cmd>Telescope live_grep<CR>", "grep"},
    b = {"<Cmd>Telescope buffers<CR>", "buffers"},
    h = {"<Cmd>Telescope help_tags<CR>", "help tags"}
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
  },
  v = {
    name = "version control",
    l = {"<Cmd>LazyGit<CR>", "lazygit"},
    s = {"<Cmd>Telescope git_status<CR>", "status"}
  }
}

wk.register_keymap('leader', keymap)
