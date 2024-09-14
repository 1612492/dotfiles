return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
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

    telescope.setup({
      defaults = {
        prompt_prefix = "   ",
        selection_caret = "  ",
        layout_config = {
          horizontal = {
            width = 0.4,
            height = 0.6,
            prompt_position = "top",
          },
        },
        preview = {
          hide_on_startup = true,
        },
      },
    })

    telescope.setup()
    telescope.load_extension("fzf")
  end,
}
