local utils = require("utils")
local existed, _ = pcall(require, "nvim-tree.config")

if not existed then
  return
end

vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_icon_padding = " "
vim.g.nvim_tree_special_files = {}
vim.g.nvim_tree_respect_buf_cwd = 1

require("nvim-tree").setup({
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
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
  git = {
    enable = true,
    ignore = false,
    timeout = 400,
  },
  renderer = {
    indent_markers = {
      enable = true,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
  },
  view = {
    hide_root_folder = false,
    number = true,
    relativenumber = true,
  },
})

utils.set_key_map("n", "<leader>e", ":NvimTreeToggle<CR>")
