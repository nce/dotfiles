require("neo-tree").setup {
  filesystem = {
    filtered_items = {
      visible = false, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
      hide_dotfiles = false,
      hide_gitignored = true
    }
  }
}
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

vim.keymap.set("n", "<leader>b", "<cmd>Neotree toggle<CR>")
vim.keymap.set("n", "<leader>r", "<cmd>Neotree reveal<CR>")
