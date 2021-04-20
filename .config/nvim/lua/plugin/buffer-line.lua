require"bufferline".setup{
  options = {
    view = "multiwindow",
    numbers = "ordinal",
    number_style = "superscript",
    mappings = true,
    buffer_close_icon= '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 18,
    max_prefix_length = 15,
    tab_size = 18,
  },
  highlights = {
    background = {
      guifg = "#adbac7",
      guibg = "#22272e"
    },
    fill = {
      guifg = comment_fg,
      guibg = "#22272e"
    },
    buffer_selected = {
      guifg = "#adbac7",
      guibg = "#2d333b",
      gui = "bold"
    },
    separator_visible = {
      guifg = "#22272e",
      guibg = "#22272e"
    },
    separator_selected = {
      guifg = "#22272e",
      guibg = "#22272e"
    },
    separator = {
      guifg = "#22272e",
      guibg = "#22272e"
    },
    indicator_selected = {
      guifg = "#22272e",
      guibg = "#22272e"
    },
    modified_selected = {
      guifg = "#adbac7",
      guibg = "#2d333b"
    }
  }
}
