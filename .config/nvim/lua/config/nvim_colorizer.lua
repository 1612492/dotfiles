local existed, colorizer = pcall(require, "colorizer")

if not existed then
  return
end

colorizer.setup()
