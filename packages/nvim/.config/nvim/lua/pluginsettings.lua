-- Git Signs
require('gitsigns').setup()

-- LSP
require('lspconfig');

local function onattach(client)
  require 'illuminate'.on_attach(client)

  -- diagnostic signs
  local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  -- update while in insert mode
  vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = true,
  })
end

-- Installer
local lsp_installer = require 'nvim-lsp-installer'

lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = onattach,
  }

  if(server.name == 'sumneko_lua') then
    opts.settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' }
        }
      }
    }
  end

  server:setup(opts)
  vim.cmd [[ do User LspAttachBuffers ]]
end)

-- Telescope
local telescope_actions = require("telescope.actions.set")

local fixfolds = {
  hidden = true,
  attach_mappings = function(_)
    telescope_actions.select:enhance({
      post = function()
	vim.cmd(":normal! zx")
      end,
    })
    return true
  end,
}

require('telescope').setup {
  pickers = {
    buffers = fixfolds,
    file_browser = fixfolds,
    find_files = fixfolds,
    git_files = fixfolds,
    grep_string = fixfolds,
    live_grep = fixfolds,
    oldfiles = fixfolds,
    -- I probably missed some
  },
}

-- Rust
require('rust-tools').setup({
  tools = { -- rust-tools options
    autoSetHints = true,
    hover_with_actions = true,
    inlay_hints = {
      show_parameter_hints = false,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
    }
  },
  server = {
    on_attach = onattach,
    settings = {
      -- to enable rust-analyzer settings visit:
      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
      ["rust-analyzer"] = {
        -- enable clippy on save
        checkOnSave = {
            command = "clippy"
        },
      }
    }
  }
})
require('rust-tools.inlay_hints').set_inlay_hints()

-- Calvera
vim.g.calvera_italic_keywords = false;
vim.g.calvera_borders = true;
vim.g.calvera_contrast = true;
vim.g.calvera_hide_eob = true;

require'calvera'.set();

-- Lualine
local gps = require("nvim-gps")
gps.setup()

require'lualine'.setup {
  options = {
    theme = 'calvera-nvim'
  },
  sections = {
    lualine_c = {{ gps.get_location, condition = gps.is_available }}
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
  },
  experimental = {
    ghost_text = true
  }
})

-- mkdir
require('mkdir')

-- Auto Pairs
require('nvim-autopairs').setup{}
