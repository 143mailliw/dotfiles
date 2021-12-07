vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  --
  -- Dependencies
  --
  use 'nvim-lua/plenary.nvim'
  use 'kyazdani42/nvim-web-devicons'

  --
  -- Appearance
  --
  use 'yashguptaz/calvera-dark.nvim' -- Color scheme
  use 'folke/todo-comments.nvim' -- Highlight TODO comments
  use 'nvim-lualine/lualine.nvim' -- Status line
  use {
    'nvim-treesitter/nvim-treesitter', -- Better syntax highlighting
    run = ':TSUpdate'
  }
  use 'onsails/lspkind-nvim' -- Show graphics in the completion list
  use 'sunjon/shade.nvim' -- Shade out windows we aren't using
  use 'folke/twilight.nvim' -- Shade out other areas of the file that we aren't using
  use 'lukas-reineke/indent-blankline.nvim' -- Indentation guides
  use 'lewis6991/gitsigns.nvim' -- Git commit signs
  use 'SmiteshP/nvim-gps' -- Shows where we are in the current file

  --
  -- Functionality
  --
  use 'nvim-telescope/telescope.nvim' -- Find files, buffers, etc.
  use "folke/trouble.nvim" -- Show diagnostics
  use {
    'AckslD/nvim-whichkey-setup.lua', -- Configure whichkey with Lua tables
    requires = {'liuchengxu/vim-which-key'}, -- Show leader keybindings
  }
  use "windwp/nvim-autopairs" -- Automatically insert pairs of characters
  use 'kdheepak/lazygit.nvim' -- Git client
  use 'goolord/alpha-nvim' -- Homepage
  use 'andweeb/presence.nvim' -- Discord RPC
  use 'tpope/vim-sleuth' -- Auto determine indentation
  use 'windwp/nvim-ts-autotag' -- TS tag utilities
  use 'jghauser/mkdir.nvim' -- Create required directories on write
  use 'voldikss/vim-floaterm' -- Ranger
  use 'github/copilot.vim' -- Github Copilot
  use 'tpope/vim-commentary' -- Commenting with 'gc'

  --
  -- Movement
  --
  use 'unblevable/quick-scope' -- Move around a line faster
  use 'takac/vim-hardtime' -- I am a duumbass who can't remember keybinds for shit
  use 'justinmk/vim-sneak' -- Jump to the next/previous occurrence of 2 characters
  use 'junegunn/vim-slash' -- Better / search
  use 'tpope/vim-unimpaired' -- Better navigation

  --
  -- LSP
  --
  use 'neovim/nvim-lspconfig' -- LSP support
  use 'simrat39/rust-tools.nvim' -- Rust support
  use 'williamboman/nvim-lsp-installer' -- Install LSP servers
  use 'hrsh7th/cmp-nvim-lsp' -- LSP completion
  use 'hrsh7th/cmp-buffer' -- Complete from current buffer
  use 'hrsh7th/nvim-cmp' -- Autocompletion handler
  use 'L3MON4D3/LuaSnip' -- Snippets
  use 'saadparwaiz1/cmp_luasnip' -- nvim-cmp snippet support
  use 'RRethy/vim-illuminate' -- Highlight instances of the same symbol
end);
