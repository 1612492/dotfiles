local status_ok, tree = pcall(require, "nvim-tree")

if not status_ok then
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
