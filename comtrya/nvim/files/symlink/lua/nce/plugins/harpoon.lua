return {
  "ThePrimeagen/harpoon",

  config = function()
    -- set keymaps
    local keymap = vim.keymap -- for conciseness
    

    keymap.set("n", "<F16>", "<cmd>lua require('harpoon.ui').nav_next()<cr>", { desc = "Go to next harpoon mark" })
    keymap.set("n", "<F17>", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", { desc = "Go to previous harpoon mark" })
    keymap.set("n", "<F18>", "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = "Mark file with harpoon" })
    keymap.set("n", "<F19>", "<cmd>Telescope harpoon marks<cr>", { desc = "Go to all har<leader>hppoon mark" })

    require("telescope").load_extension('harpoon')
  end,
}
