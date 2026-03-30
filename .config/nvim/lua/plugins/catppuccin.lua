return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = true,
  priority = 1000,
  init = function()
    vim.cmd.colorscheme("catppuccin-nvim")
  end,
  opts = {
    flavour = "mocha",
    transparent_background = true,
    float = {
      transparent = true,
    },
    term_colors = true,
    lsp_styles = {
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
        ok = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
        ok = { "underline" },
      },
      inlay_hints = {
        background = true,
      },
    },
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
