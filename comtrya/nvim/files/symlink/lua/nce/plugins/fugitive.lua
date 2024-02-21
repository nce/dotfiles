return {
  'tpope/vim-fugitive',
  dependencies = {
    'tpope/vim-rhubarb',
  },

  config = function()
    vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
    vim.keymap.set("n", "<leader>gc", function()
      vim.cmd.Git({'commit', '-v'})
    end, opts)
    vim.keymap.set("n", "<leader>gl", function()
      vim.cmd.Git('pull')
    end, opts)
    vim.keymap.set("n", "<leader>gp", function()
      vim.cmd.Git('push')
    end, opts)
    vim.keymap.set("n", "<leader>gg", function()
      vim.cmd.Git({'log --oneline'})
    end, opts)
    vim.keymap.set("n", "<leader>go", vim.cmd.GBrowse)
  end

}
