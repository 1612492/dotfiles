require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<C-f>"] = require("telescope.actions").cycle_history_next,
        ["<C-b>"] = require("telescope.actions").cycle_history_prev,
      },
    },
  },
}
