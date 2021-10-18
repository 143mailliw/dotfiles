-- LSP
local lsp_installer = require 'nvim-lsp-installer'

lsp_installer.on_server_ready(function(server)
    local opts = {
      on_attach = function(client)
        require 'illuminate'.on_attach(client)
      end,
    }

    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
end)


-- Calvera
vim.g.calvera_italic_keywords = false;
vim.g.calvera_borders = true;
vim.g.calvera_contrast = true;
vim.g.calvera_hide_eob = true;

require'calvera'.set();

-- Pears
require "pears".setup()

-- Lualine
require'lualine'.setup {
  options = {
    theme = 'calvera-nvim'
  },
  sections = {
    lualine_c = {{
      'diagnostics',
      sources = {"nvim_lsp"}
    }},
  },
  tabline = {
    lualine_a = {'buffers'},
    lualine_z = {'tabs'}
  }
};

-- TreeSitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
  }
}

-- Dashboard
local dashboard = require("alpha.themes.dashboard")

dashboard.section.buttons.val = {
  dashboard.button('<Leader>bn', " New file", "<Cmd>new<CR>"),
  dashboard.button('<Leader>ff', " Find file", "<Cmd>Telescope find_files<CR>"),
  dashboard.button('<Leader>fr', " Recent", "<Cmd>Telescope oldfiles<CR>"),
  dashboard.button('<Leader>nc', " Config", "<Cmd>cd ~/.config/nvim<CR>"),
  dashboard.button('<Leader>ns', " Packer sync", "<Cmd>PackerSync<CR>"),
  dashboard.button('q', " Quit", "<Cmd>:qa<CR>")
}

require'alpha'.setup(dashboard.opts)

-- Shade
require'shade'.setup({
  overlay_opacity = 50,
  opacity_step = 1,
})

-- Twilight
require("twilight").setup {}

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
