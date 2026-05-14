return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    animate = { enabled = true },
    bigfile = { enabled = true },
    image = {
      enabled = true,
      doc = {
        enabled = false,
      },
    },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    picker = {
      enabled = true,
      sources = {
        files = {
          hidden = true,
        },
      },
    },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
  },
  keys = {
    {
      "<leader>f",
      function()
        Snacks.picker.files()
      end,
    },
    {
      "<leader>g",
      function()
        Snacks.picker.grep()
      end,
    },
  },
}
