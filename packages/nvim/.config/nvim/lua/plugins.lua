vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  --
  -- Appearance
  --

  -- Calvera Dark (theme)
  use 'yashguptaz/calvera-dark.nvim'
  -- Comment indicators
  use {
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
  }
  -- Status Line
  use 'hoob3rt/lualine.nvim'
  -- TreeSitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  -- Buffer Line
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons'
  }
  -- LSP kind
  use 'onsails/lspkind-nvim'
  -- LSP status
  use 'arkav/lualine-lsp-progress'

  --
  -- Functionality
  --

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- Trouble
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }
  -- WhichKey
  use {
    'AckslD/nvim-whichkey-setup.lua',
    requires = {'liuchengxu/vim-which-key'},
  }
  -- Auto Pairs
  use 'jiangmiao/auto-pairs'
  -- LazyGit
  use 'kdheepak/lazygit.nvim'

  --
  -- LSP
  --

  -- LSP Config
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  -- nvim-cmp
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'
  -- LuaSnip
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  -- Illuminate
  use 'RRethy/vim-illuminate'
end);
