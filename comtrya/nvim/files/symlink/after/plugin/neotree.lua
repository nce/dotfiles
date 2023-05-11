vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

vim.keymap.set("n", "<leader>b", "<cmd>NeoTreeFocusToggle<CR>")
vim.keymap.set("n", "<leader>r", "<cmd>NeoTreeRevealToggle<CR>")
