return {
  "rose-pine/neovim",
  priority = 1000,
  name = "rose-pine",

  config = function()
    dark_variant = 'moon'

    vim.cmd("colorscheme rose-pine")
  end
}
