local utils = require("utils")
local existed, fzf = pcall(require, "fzf-lua")

fzf.setup({
  winopts = {
    hl = {
      normal = "Normal",
      border = "FloatBorder",
      help_normal = "Normal",
      help_border = "FloatBorder",
      cursor = "Cursor",
      cursorline = "CursorLine",
      cursorlinenr = "CursorLineNr",
      search = "IncSearch",
      title = "Normal",
      scrollfloat_e = "PmenuSbar",
      scrollfloat_f = "PmenuThumb",
      scrollborder_e = "FloatBorder",
      scrollborder_f = "FloatBorder",
    },
  },
})

utils.set_key_map("n", "<leader>f", "<cmd>lua require('fzf-lua').files()<cr>")
utils.set_key_map("n", "<leader>g", "<cmd>lua require('fzf-lua').live_grep()<cr>")
