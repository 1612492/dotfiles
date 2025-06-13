return {
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
      blink_cmp = true,
      diffview = true,
      fidget = true,
      mason = true,
      nvim_surround = true,
      snacks = true,
    },
  },
}
