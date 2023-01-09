function config()
  require("catppuccin").setup({
    flavour = "mocha",
    transparent_background = true,
    integrations = {
      barbar = true,
      cmp = true,
      fidget = true,
      gitsigns = true,
      markdown = true,
      mason = true,
      nvimtree = true,
      treesitter = true,
      indent_blankline = {
        enabled = true,
        colored_indent_levels = true,
      },
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
        },
      },
    },
  })

  vim.cmd.colorscheme("catppuccin")
end

return config
