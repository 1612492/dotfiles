local utils = require("utils")
local existed, _ = pcall(require, "nvim-tree.config")

if not existed then
  return
end

vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_icon_padding = " "
vim.g.nvim_tree_special_files = {}

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
    }
  },
  view = {
    hide_root_folder = false,
    auto_resize = true,
    number = true,
    relativenumber = true
  },
})

utils.set_key_map("n", "<leader>e", ":NvimTreeToggle<CR>")
