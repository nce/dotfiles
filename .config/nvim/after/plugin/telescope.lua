local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>o', builtin.find_files, {})
vim.keymap.set('n', '<leader>po', builtin.git_files, {})

vim.keymap.set('n', '<leader>pgs', builtin.git_status, {})
vim.keymap.set('n', '<leader>pc', builtin.git_commits, {})
vim.keymap.set('n', '<leader>pb', builtin.git_branches, {})

require('telescope').setup{
  defaults = {
    prompt_prefix = " ",
    selection_caret = "> ",
    path_display = { "smart" },
  },

  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    }
  }

}

