local existed, colorizer = pcall(require, "colorizer")

if not existed then
  return
end

colorizer.setup({
  "*",
  css = {
    RRGGBBAA = true,
    rgb_fn = true,
    hsl_fn = true,
  },
})
