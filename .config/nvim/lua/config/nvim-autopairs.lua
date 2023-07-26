return function()
  require("nvim-autopairs").setup({
    check_ts = true,
    ts_config = {
      lua = { "string", "source" },
      javascript = { "string", "template_string" },
    },
    disable_in_macro = true,
    disable_in_visualblock = true,
    map_c_w = true,
  })
end
