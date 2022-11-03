local status_ok, colorizer = pcall(require, "colorizer")

if not status_ok then
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
