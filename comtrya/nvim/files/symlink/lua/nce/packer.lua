local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = {
      {'nvim-lua/plenary.nvim'}
    }
  }

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
  }

  use {
    'nvim-tree/nvim-web-devicons'
  }

  use {
    'rose-pine/neovim',
    as = 'rose-pine'
  }

  use ({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    }
  })

  use {
    "folke/noice.nvim",
    requires = {
      {'MunifTanjim/nui.nvim'},
      {'rcarriga/nvim-notify'},
    }
  }

  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},
      {'github/copilot.vim'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }

  -- Git
  use { 'tpope/vim-fugitive' }
  use { 'tpope/vim-rhubarb' }
  -- use { 'airblade/vim-gitgutter' }
  use { 'lewis6991/gitsigns.nvim' }

  -- Visual
  use { 'folke/zen-mode.nvim' }
  use { 'feline-nvim/feline.nvim' }
  use { 'pearofducks/ansible-vim' }
  use { 'ntpeters/vim-better-whitespace' }

  -- npm install -g @compodoc/live-server
  use { 'davidgranstrom/nvim-markdown-preview' }

  -- Handling
  use { 'alexghergh/nvim-tmux-navigation' }
  use { 'nanotee/zoxide.vim' }
  use { "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
