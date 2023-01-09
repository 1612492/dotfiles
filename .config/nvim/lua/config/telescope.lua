function config()
  require("telescope").setup({
    defaults = {
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
      },
      file_ignore_patterns = { "^.git/", "^node_modules/" },
      prompt_prefix = "   ",
      selection_caret = "  ",
      layout_config = {
        horizontal = {
          preview_width = 0.55,
        },
        width = 0.95,
        height = 0.95,
        preview_cutoff = 120,
        vertical = { mirror = false },
      },
      mappings = {
        i = {
          ["<C-f>"] = require("telescope.actions").cycle_history_next,
          ["<C-b>"] = require("telescope.actions").cycle_history_prev,
        },
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

  require("telescope").load_extension("fzf")
end

return config
