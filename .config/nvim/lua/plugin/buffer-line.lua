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
      guifg = "#a6accd",
      guibg = "#292d3e"
    },
    fill = {
      guifg = comment_fg,
      guibg = "#292d3e"
    },
    buffer_selected = {
      guifg = "#a6accd",
      guibg = "#343b51",
      gui = "bold"
    },
    separator_visible = {
      guifg = "#292d3e",
      guibg = "#292d3e"
    },
    separator_selected = {
      guifg = "#292d3e",
      guibg = "#292d3e"
    },
    separator = {
      guifg = "#292d3e",
      guibg = "#292d3e"
    },
    indicator_selected = {
      guifg = "#292d3e",
      guibg = "#292d3e"
    },
    modified_selected = {
      guifg = "#a6accd",
      guibg = "#343b51"
    }
  }
}
