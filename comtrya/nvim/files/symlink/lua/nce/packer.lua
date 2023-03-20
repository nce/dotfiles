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
    run = ':TSUpdate'
  })

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
    
      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }

  -- Git
  use { 'tpope/vim-fugitive' }
  use { 'tpope/vim-rhubarb' }

  -- Visual
  use { 'folke/zen-mode.nvim' }
  use { 'feline-nvim/feline.nvim' }
  use { 'pearofducks/ansible-vim' }

  -- npm install -g @compodoc/live-server
  use { 'davidgranstrom/nvim-markdown-preview' }

  -- Handling
  use { 'alexghergh/nvim-tmux-navigation' }
  use { 'nanotee/zoxide.vim' }
  use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = { 
      "MunifTanjim/nui.nvim",
    },
      require("neo-tree").setup({
        filesystem = {
          filtered_items = {
            visible = false, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
            hide_dotfiles = false,
            hide_gitignored = true
          }
        }
      })
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
