-- LSP installer
local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
    local opts = {
      on_attach = function(client)
        require 'illuminate'.on_attach(client)
      end,
    }

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
end)

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

-- Buffer Line
require('bufferline').setup {
  options = {
    close_command = "bdelete! %d",
    left_mouse_command = "buffer %d",
    right_mouse_command = nil,
    tab_size = 12,
    diagnostics = "nvim_lsp",
    seperator_style = "thick",
    sort_by = "id",
  }
}

-- nvim-cmp
local cmp = require 'cmp'
local lspkind = require 'lspkind'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    {name = 'nvim_lsp'},
    {name = 'buffer'}
  },
  formatting = {
    format = lspkind.cmp_format({with_text = true, maxwidth = 50})
  },
  documentation = {}
})

-- Telescope
-- vim.api.nvim_set_keymap('n', '<Leader>ff', '<Cmd>lua require("telescope.builtin").find_files()<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<Leader>fg', '<Cmd>lua require("telescope.builtin").live_grep()<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<Leader>fb', '<Cmd>lua require("telescope.builtin").buffers()<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<Leader>fh', '<Cmd>lua require("telescope.builtin").help_tags()<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<Leader>gr', '<Cmd>lua require("telescope.builtin").lsp_references()<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<Leader>ga', '<Cmd>lua require("telescope.builtin").lsp_code_actions()<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<Leader>gd', '<Cmd>lua require("telescope.builtin").lsp_definitions()<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<Leader>gi', '<Cmd>lua require("telescope.builtin").lsp_implementations()<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<Leader>vs', '<Cmd>lua require("telescope.builtin").git_status<CR>', { noremap = true, silent = true })
--
-- -- Trouble
-- vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>", {silent = true, noremap = true})
-- vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>", {silent = true, noremap = true})
-- vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>", {silent = true, noremap = true})
-- vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", {silent = true, noremap = true})
-- vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", {silent = true, noremap = true})
