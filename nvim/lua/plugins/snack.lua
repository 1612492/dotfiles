return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    animate = { enabled = true },
    bigfile = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    picker = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    {
      "<leader>f",
      function()
        require("snacks").picker.files()
      end,
    },
    {
      "<leader>g",
      function()
        require("snacks").picker.grep()
      end,
    },
    {
      "<leader>b",
      function()
        require("snacks").picker.buffers()
      end,
    },
  },
}
