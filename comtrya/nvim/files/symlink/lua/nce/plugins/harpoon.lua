return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",

  config = function()
    local harpoon = require("harpoon")

    harpoon:setup()

    vim.keymap.set("n", "<F16>", function() harpoon:list():append() end)
    vim.keymap.set("n", "<C-[>", function() harpoon:list():remove() end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<F18>", function() harpoon:list():prev() end)
    vim.keymap.set("n", "<F19>", function() harpoon:list():next() end)
    -- basic telescope configuration
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
          results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
      }):find()
    end

    vim.keymap.set("n", "<F17>", function() toggle_telescope(harpoon:list()) end,
      { desc = "Open harpoon window" })
  end,
}
