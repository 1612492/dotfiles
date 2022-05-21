local existed, autopairs = pcall(require, "nvim-autopairs")

if not existed then
  return
end

autopairs.setup({
  check_ts = true,
  ts_config = {
    lua = { "string", "source" },
    javascript = { "string", "template_string" },
  },
  disable_filetype = { "TelescopePrompt" },
  disable_in_macro = true,
  disable_in_visualblock = true,
})
