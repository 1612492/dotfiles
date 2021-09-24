local utils = require("utils")
local existed, _ = pcall(require, "nvim-tree.config")

if not existed then
  return
end

vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_width_allow_resize = 1
vim.g.nvim_tree_lsp_diagnostics = 1
vim.g.nvim_tree_icon_padding = " "
vim.g.nvim_tree_update_cwd = 1
vim.g.nvim_tree_special_files = {}
vim.g.nvim_tree_icons = {
  lsp = {
    hint = " ",
    info = " ",
    warning = " ",
    error = " ",
  },
}

utils.set_key_map("n", "<leader>e", ":NvimTreeToggle<CR>")
