require("catppuccin").setup({
  flavour = "mocha",
  transparent_background = true,
  float = {
    transparent = true,
  },
  integrations = {
    blink_cmp = true,
    diffview = true,
    fidget = true,
    mason = true,
    nvim_surround = true,
    snacks = true,
  },
})

vim.cmd.colorscheme("catppuccin-nvim")
