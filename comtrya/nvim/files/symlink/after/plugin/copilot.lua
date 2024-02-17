vim.keymap.set("i", "<C-j>", "<Plug>(copilot-next)",{})
vim.keymap.set("i", "<C-k>", "<Plug>(copilot-previous)",{})

vim.api.nvim_set_keymap('i', '<C-n>', 'copilot#Accept("<CR>")', {expr=true, silent=true})

vim.g.copilot_assume_mapped = true
