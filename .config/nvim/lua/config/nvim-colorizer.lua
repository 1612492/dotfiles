function config()
  require("colorizer").setup({
    "*",
    css = {
      RRGGBBAA = true,
      rgb_fn = true,
      hsl_fn = true,
    },
  })
end

return config
