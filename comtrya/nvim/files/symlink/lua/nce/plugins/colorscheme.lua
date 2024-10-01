return {
  "rose-pine/neovim",
  priority = 1000,
  name = "rose-pine",

  config = function()
    local rose = require("rose-pine")
    rose.setup({
      dark_variant = 'moon',
      dim_inactive_windows = false,
      extend_background_behind_borders = true,

      enable = {
          terminal = true,
          legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
          migrations = true, -- Handle deprecated options automatically
      },

      styles = {
          bold = true,
          italic = true,
          transparency = true,
      },
    })

    vim.cmd("colorscheme rose-pine")
  end
}
