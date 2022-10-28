local utils = require("utils")
local existed, tree = pcall(require, "nvim-tree")

if not existed then
  return
end

tree.setup({
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = " ",
      info = " ",
      warning = " ",
      error = " ",
    },
  },
  renderer = {
    indent_markers = {
      enable = true,
    },
    highlight_git = true,
    highlight_opened_files = "all",
    special_files = {},
  },
  view = {
    number = true,
    relativenumber = true,
  },
  respect_buf_cwd = true,
})

utils.set_key_map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")
