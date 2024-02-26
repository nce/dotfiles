return {
  "ThePrimeagen/harpoon",

  config = function()
    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>hx", "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = "Mark file with harpoon" })
    keymap.set("n", "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", { desc = "Go to next harpoon mark" })
    keymap.set("n", "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", { desc = "Go to previous harpoon mark" })
    keymap.set("n", "<leader>ho", "<cmd>Telescope harpoon marks<cr>", { desc = "Go to all harpoon mark" })

    require("telescope").load_extension('harpoon')
  end,
}
