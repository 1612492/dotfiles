return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  keys = {
    {
      "<leader>f",
      function()
        require("telescope.builtin").find_files()
      end,
    },
    {
      "<leader>g",
      function()
        require("telescope.builtin").live_grep()
      end,
    },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        prompt_prefix = "   ",
        selection_caret = "  ",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
          },
        },
        mappings = {
          i = {
            ["<C-f>"] = actions.cycle_history_next,
            ["<C-b>"] = actions.cycle_history_prev,
          },
        },
      },
    })

    telescope.load_extension("fzf")
  end,
}
