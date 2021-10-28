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
  use 'nvim-lualine/lualine.nvim'
  -- TreeSitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  -- LSP kind
  use 'onsails/lspkind-nvim'
  -- LSP status
  use 'arkav/lualine-lsp-progress'
  -- Shade
  use 'sunjon/shade.nvim'
  -- Twilight
  use 'folke/twilight.nvim'
  -- Indent Guides
  use 'lukas-reineke/indent-blankline.nvim'
  -- Git Signs
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
  }
  -- GPS
  use 'SmiteshP/nvim-gps'

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
  use "windwp/nvim-autopairs"
  -- LazyGit
  use 'kdheepak/lazygit.nvim'
  -- Alpha
  use 'goolord/alpha-nvim'
  -- Discord Presence
  use 'andweeb/presence.nvim'
  -- Sleuth
  use 'tpope/vim-sleuth'
  -- Close Tag
  use 'windwp/nvim-ts-autotag'
  -- Create directories for new files
  use 'jghauser/mkdir.nvim'
  -- FloatTerm
  use 'voldikss/vim-floaterm'
  -- Copilot
  use 'github/copilot.vim'

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
