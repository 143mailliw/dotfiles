-- Calvera
vim.g.calvera_italic_keywords = false;
vim.g.calvera_borders = true;
vim.g.calvera_contrast = true;
vim.g.calvera_hide_eob = true;

require'calvera'.set();

-- Lualine
require'lualine'.setup {
  options = {
    theme = 'calvera-nvim'
  }
};

-- TreeSitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

-- Telescope
vim.api.nvim_set_keymap('n', '<Leader>ff', '<Cmd>lua require("telescope.builtin").find_files()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fg', '<Cmd>lua require("telescope.builtin").live_grep()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fb', '<Cmd>lua require("telescope.builtin").buffers()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fh', '<Cmd>lua require("telescope.builtin").help_tags()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gr', '<Cmd>lua require("telescope.builtin").lsp_references()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ga', '<Cmd>lua require("telescope.builtin").lsp_code_actions()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gd', '<Cmd>lua require("telescope.builtin").lsp_definitions()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gi', '<Cmd>lua require("telescope.builtin").lsp_implementations()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>vs', '<Cmd>lua require("telescope.builtin").git_status<CR>', { noremap = true, silent = true })

