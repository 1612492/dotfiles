function config()
  require("indent_blankline").setup({
    char = "│",
    buftype_exclude = { "terminal", "help", "nofile", "nowrite", "quickfix", "prompt" },
    filetype_exclude = { "markdown", "help", "packer", "NvimTree" },
    context_patterns = {
      "class",
      "return",
      "function",
      "method",
      "^if",
      "^while",
      "jsx_element",
      "^for",
      "^object",
      "^table",
      "block",
      "arguments",
      "if_statement",
      "else_clause",
      "jsx_element",
      "jsx_self_closing_element",
      "try_statement",
      "catch_clause",
      "import_statement",
      "operation_type",
    },
    show_trailing_blankline_indent = false,
    show_current_context = true,
    show_current_context_start = true,
    show_first_indent_level = true,
    use_treesitter = true,
  })
end

return config
