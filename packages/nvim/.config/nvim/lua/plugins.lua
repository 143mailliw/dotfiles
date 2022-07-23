local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  --
  -- Appearance
  --

  -- Catpuccin | colorscheme
  use {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      vim.g.catppuccin_flavour = "mocha"
      require("catppuccin").setup()
      vim.cmd [[colorscheme catppuccin]]
    end
  }

  -- Lualine | theme all the lines
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup({
        tabline = {
          lualine_a = {'buffers'},
          lualine_z = {'tabs'}
        }
      })
    end
  }

  -- nvim-ufo | retrieve folds from LSP
  use {
    'kevinhwang91/nvim-ufo',
    requires = 'kevinhwang91/promise-async',
    config = function()
      require('ufo').setup({
        provider_selector = function()
          return {'lsp', 'treesitter', 'indent'} -- fallback to TS folds
        end
      })
    end
  }

  -- todo-comments | highlight TODO, FIXME, WARNING etc. this only shows up in the beginning of comments, the highlights in this one are unrelated
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require('todo-comments').setup({})
    end
  }

  -- alpha-nvim | startup screen
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.buttons.val = {
        dashboard.button('<Leader>bn', " New file", "<Cmd>enew<CR>"),
        dashboard.button('<Leader>ff', " Find file", "<Cmd>Telescope find_files<CR>"),
        dashboard.button('<Leader>fr', " Recent", "<Cmd>Telescope oldfiles<CR>"),
        dashboard.button('<Leader>nc', " Config", "<Cmd>cd ~/.config/nvim<CR>"),
        dashboard.button('<Leader>ns', " Packer sync", "<Cmd>PackerSync<CR>"),
        dashboard.button('q', " Quit", "<Cmd>:qa<CR>")
      }

      require('alpha').setup(dashboard.opts)
    end
  }

  -- indent-blankline | indent guides
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function ()
      require("indent_blankline").setup {
        show_end_of_line = true,
        show_current_context = true,
        buftype_exclude = {"terminal", "telescope", "nofile"}
      }
    end
  }

  --
  -- Functionality
  --

  -- Telescope | find files, buffers, etc.
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function()
      -- telescope requires a workaround for folding (nvim-telescope/telescope.nvim#559)
      vim.api.nvim_create_autocmd('BufRead', {
         callback = function()
            vim.api.nvim_create_autocmd('BufWinEnter', {
               once = true,
               callback = function()
                  vim.defer_fn(function()
                     vim.api.nvim_feedkeys('zx', 'm', false)
                  end, 70)
               end
            })
         end
      })
    end
  }

  -- which-key | shows a guide for your leader shortcuts
  use {
    'AckslD/nvim-whichkey-setup.lua', -- allows us to configure it with Lua
    requires = {'liuchengxu/vim-which-key'}
  }

  -- spellsitter | speel cheks coments (run :set spell to enable) 
  use {
    'lewis6991/spellsitter.nvim',
    config = function()
      require('spellsitter').setup()
    end
  }

  -- autopairs | automatically closes paired characters, eg {}, (), ''
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  }

  -- commentary | allows to use G-c to comment out blocks in visual mode
  use 'tpope/vim-commentary'

  -- trouble | pin a list of errors, todos, etc. to the bottom of the screen
  use {
    'folke/trouble.nvim',
    config = function()
      require('trouble').setup()
    end
  }

  -- lazygit | git GUI
  use "kdheepak/lazygit.nvim"

  -- nvim-treesitter | better syntax highlighting, fallback folds
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  --
  -- Functionality (LSP)
  --

  -- nvim-lspconfig | allows configuration of LSP servers
  use 'neovim/nvim-lspconfig'

  -- vim-illuminate | highlights instances of the same symbol
  use 'RRethy/vim-illuminate'

  -- lsp-installer | manages installing our lsp servers for us
  use {
    'williamboman/nvim-lsp-installer',
    config = function()
      require('nvim-lsp-installer').setup({})

      -- manually add some configuration
      local lspconfig = require("lspconfig");

      -- we need to advertise aditional capabilities for nvim-ufo
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingRange = {
          dynamicRegistration = false,
          lineFoldingOnly = true
      }

      capabilities = require('cmp_nvim_lsp').up

      local function on_attach(client)
        -- attach illuminate
        require('illuminate').on_attach(client)

        -- diagnostic signs
        local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
        for type, icon in pairs(signs) do
          local hl = "DiagnosticSign" .. type
          vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end

        -- update while in insert mode
        -- vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        --   virtual_text = false,
        --   signs = true,
        --   underline = true,
        --   update_in_insert = true,
        -- })
      end

      lspconfig.sumneko_lua.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }
            }
          }
        }
      })

      lspconfig.tsserver.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          init_options = {
            preferences = { -- i don't remember why but this is very important
              importModuleSpecifierEnding = "js",
              importModuleSpecifierPreference = "relative",
            }
          }
        }
      })
    end
  }

  -- fidget | shows status of the LSP server
  use {
    'j-hui/fidget.nvim',
    config = function()
      require('fidget').setup({})
    end
  }

  -- lsp_signature | shows the signature of a function when typing parameters
  use {
    'ray-x/lsp_signature.nvim',
    config = function()
      require('lsp_signature').setup()
    end
  }

  -- lsp_lines | shows errors differently (go to the git repo for examples)
  use {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    config = function()
      vim.diagnostic.config({
        virtual_text = false;
      })
      require("lsp_lines").setup()
    end
  }

  --
  -- Functionality (Autocomplete)
  --

  -- nvim-cmp | the actual completion engine
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require('cmp')
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
          ['<Right>'] = cmp.mapping.confirm({ select = true }),
          ['<Down>'] = cmp.mapping(function (fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end),
          ['<Up>'] = cmp.mapping(function (fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end)
        },
        sources = cmp.config.sources({
          {name = 'nvim_lsp'},
          {name = 'luasnip'},
          {name = 'buffer'},
          {name = 'path'},
          {name = 'calc'}
        })
      })
    end
  }

  -- luasnip | provides snippeting - i don't actually use snippets but you need one or it doesn't work
  use 'L3MON4D3/LuaSnip'

  -- nvim-cmp sources
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source
  use 'hrsh7th/cmp-buffer' -- complete from text already in buffer
  use 'hrsh7th/cmp-path' -- complete filepaths
  use 'hrsh7th/cmp-calc' -- use auto-complete as a calculator
  use 'saadparwaiz1/cmp_luasnip' -- luasnip source

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
