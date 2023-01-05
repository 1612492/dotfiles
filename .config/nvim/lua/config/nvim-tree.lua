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
      mappings = {
        list = {
          { key = "d", action = "trash" },
        },
      },
    },
    renderer = {
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
  })
end

return config
