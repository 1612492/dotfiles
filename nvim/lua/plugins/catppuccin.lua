return {
  "nvim-tree/nvim-web-devicons",
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    priority = 1000,
    init = function()
      vim.cmd.colorscheme("catppuccin")
    end,
    opts = {
      flavour = "mocha",
      transparent_background = true,
      integrations = {
        barbar = true,
        diffview = true,
        mason = true,
      },
    },
  },
}
