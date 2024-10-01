return {
  'folke/zen-mode.nvim',

  config = function()
    require("zen-mode").setup {
      window = {
        width = 90,
        options = {
          number = true,
          relativenumber = true,
        }
      },
      plugins = {
        tmux = { enabled = true },
        wezterm = {
          enabled = true,
          font = "+20", -- (10% increase per step)
        },
      },
    }

    vim.keymap.set("n", "<leader>zz", function()
      require("zen-mode").toggle()
      vim.wo.wrap = false
    end)
  end
}
