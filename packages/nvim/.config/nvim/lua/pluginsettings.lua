-- LSP
local lsp_installer = require 'nvim-lsp-installer'

lsp_installer.on_server_ready(function(server)
    local opts = {
      on_attach = function(client)
        require 'illuminate'.on_attach(client)

        -- update while in insert mode
        vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
          virtual_text = true,
          signs = true,
          underline = true,
          update_in_insert = true,
        })

        -- change diagnostic symbols
        local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }

        for type, icon in pairs(signs) do
          local hl = "LspDiagnosticsSign" .. type
          vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end
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

-- Lualine
require'lualine'.setup {
  options = {
    theme = 'calvera-nvim'
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
  autotag = {
    enable = true
  }
}

-- Dashboard
local dashboard = require("alpha.themes.dashboard")

dashboard.section.buttons.val = {
  dashboard.button('<Leader>bn', " New file", "<Cmd>enew<CR>"),
  dashboard.button('<Leader>ff', " Find file", "<Cmd>Telescope find_files<CR>"),
  dashboard.button('<Leader>fr', " Recent", "<Cmd>Telescope oldfiles<CR>"),
  dashboard.button('<Leader>nc', " Config", "<Cmd>cd ~/.config/nvim<CR>"),
  dashboard.button('<Leader>ns', " Packer sync", "<Cmd>PackerSync<CR>"),
  dashboard.button('q', " Quit", "<Cmd>:qa<CR>")
}

require'alpha'.setup(dashboard.opts)

-- Indent Guides
require("indent_blankline").setup {
  show_end_of_line = true,
  show_current_context = true,
  buftype_exclude = {"terminal", "telescope", "nofile"}
}

-- Shade
require'shade'.setup({
  overlay_opacity = 50,
  opacity_step = 1,
})

-- Twilight
require("twilight").setup {}

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
  documentation = {
    zindex = 10000
  }
})

-- Git Signs
require('gitsigns').setup()

-- mkdir
require('mkdir')
