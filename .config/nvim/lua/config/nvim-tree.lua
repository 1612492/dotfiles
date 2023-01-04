function config()
  require("nvim-tree").setup({
    disable_netrw = true,
    open_on_setup = true,
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
      enable = true,
      update_root = true,
    },
    diagnostics = {
      enable = true,
      icons = {
        error = " ",
        warning = " ",
        info = " ",
        hint = " ",
      },
    },
    view = {
      adaptive_size = true,
    },
    renderer = {
      add_trailing = true,
      highlight_git = true,
      highlight_opened_files = "all",
      indent_markers = {
        enable = true,
      },
      special_files = {},
    },
    trash = {
      cmd = "trash",
    },
    actions = {
      open_file = {
        quit_on_open = false,
      },
    },
  })
end

return config
