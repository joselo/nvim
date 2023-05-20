-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Colors

  use({ 'rose-pine/neovim', as = 'rose-pine' })

  --  Treesitter

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  -- Neotest

  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "jfpedroza/neotest-elixir"
    }
  }

  -- Comment

  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }

  -- Aerial

  use {
    'stevearc/aerial.nvim',
    config = function() require('aerial').setup() end
  }

  -- Gitsigns

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  -- Diffview
  use "sindrets/diffview.nvim" 


  -- Icons (Used for some packs"

  use "nvim-tree/nvim-web-devicons"

  -- Fzf
  use { 'ibhagwan/fzf-lua',
    -- optional for icon support
    requires = { 'nvim-tree/nvim-web-devicons' }
  }
  use = { 'junegunn/fzf', run = './install --bin', }
end)
