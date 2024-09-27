return {
  "ibhagwan/fzf-lua",
  keys = {
    {
      "<leader>f",
      function()
        require("fzf-lua").files()
      end,
    },
    {
      "<leader>g",
      function()
        require("fzf-lua").live_grep()
      end,
    },
  },
  opts = {},
}
