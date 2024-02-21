return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',

  dependencies = {
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'jvgrootveld/telescope-zoxide'
  },

  config = function()
    local builtin = require('telescope.builtin')
    local z_utils = require("telescope._extensions.zoxide.utils")

    vim.keymap.set('n', '<leader>o', builtin.find_files, {})
    vim.keymap.set('n', '<leader>po', builtin.git_files, {})

    vim.keymap.set('n', '<leader>c', builtin.buffers, {})
    vim.keymap.set('n', '<leader>s', builtin.live_grep, {})

    vim.keymap.set('n', '<leader>pgs', builtin.git_status, {})
    vim.keymap.set('n', '<leader>pc', builtin.git_commits, {})
    vim.keymap.set('n', '<leader>pb', builtin.git_branches, {})

    vim.keymap.set("n", "<leader>cd", require("telescope").extensions.zoxide.list)

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
        },
        zoxide = {
          prompt_title = "[ zoxide ]",
          mappings = {
            default = {
              after_action = function(selection)
                print("Update to (" .. selection.z_score .. ") " .. selection.path)
              end
            },
            ["<C-s>"] = {
              before_action = function(selection) print("before C-s") end,
              action = function(selection)
                vim.cmd.edit(selection.path)
              end
            },
            -- Opens the selected entry in a new split
            ["<C-q>"] = { action = z_utils.create_basic_command("split") },
          },
        }
      }
    }

    require("telescope").load_extension("zoxide")
    require("telescope").load_extension("noice")
    require("telescope").load_extension("fzf")
  end

}
