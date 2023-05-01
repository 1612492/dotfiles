function config()
  local fb_actions = require("telescope._extensions.file_browser.actions")

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
      file_browser = {
        path = "%:p:h",
        initial_mode = "normal",
        select_buffer = true,
        grouped = true,
        hidden = true,
        hijack_netrw = true,
        respect_gitignore = false,
        mappings = {
          ["i"] = {
            ["<C-a>"] = fb_actions.create,
            ["<C-r>"] = fb_actions.rename,
            ["<C-m>"] = fb_actions.move,
            ["<C-y>"] = fb_actions.copy,
            ["<C-d>"] = fb_actions.remove,
          },
          ["n"] = {
            ["a"] = fb_actions.create,
          },
        },
      },
    },
  })

  require("telescope").load_extension("fzf")
  require("telescope").load_extension("file_browser")
end

return config
