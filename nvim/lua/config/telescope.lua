local icon = require("icon")

return function()
  local telescope = require("telescope")
  local actions = require("telescope.actions")
  local sorters = require("telescope.sorters")

  telescope.setup({
    defaults = {
      vimgrep_arguments = {
        "rg",
        "-L",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
      },
      prompt_prefix = icon.search,
      selection_caret = icon.selection,
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "ascending",
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
          results_width = 0.8,
        },
        vertical = {
          mirror = false,
        },
        width = 0.8,
        height = 0.8,
        preview_cutoff = 120,
      },
      file_sorter = sorters.get_fuzzy_file,
      file_ignore_patterns = { "node_modules" },
      generic_sorter = sorters.get_generic_fuzzy_sorter,
      path_display = { "truncate" },
      mappings = {
        i = {
          ["<Tab>"] = actions.move_selection_next,
          ["<S-Tab>"] = actions.move_selection_previous,
          ["<C-f>"] = actions.cycle_history_next,
          ["<C-b>"] = actions.cycle_history_prev,
        },
        n = { q = actions.close },
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
    },
  })

  telescope.load_extension("fzf")
  telescope.load_extension("flutter")
end
