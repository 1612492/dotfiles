return {
  "saghen/blink.cmp",
  lazy = false,
  version = "v0.*",
  opts = {
    keymap = {
      hide = "<c-e>",
      accept = "<cr>",
      select_prev = "<c-p>",
      select_next = "<c-n>",
      scroll_documentation_up = "<c-u>",
      scroll_documentation_down = "<c-d>",
      snippet_forward = "<c-j>",
      snippet_backward = "<c-k>",
    },
    windows = {
      autocomplete = {
        border = "rounded",
      },
      documentation = {
        border = "rounded",
        auto_show = true,
      },
    },
  },
}
