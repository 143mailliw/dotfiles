vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  
  --
  -- Appearance
  --

  -- Icons
  use 'ryanoasis/vim-devicons'
  -- Calvera Dark (theme)
  use 'yashguptaz/calvera-dark.nvim'
  -- Comment indicators
  use {
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('todo-comments').setup {
        
      }
    end
  }
  -- Status Line
  use 'hoob3rt/lualine.nvim'
  -- TreeSitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
 

  --
  -- Functionality
  --
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  --
  -- LSP
  --

  -- LSP Config
  use 'neovim/nvim-lspconfig'
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
