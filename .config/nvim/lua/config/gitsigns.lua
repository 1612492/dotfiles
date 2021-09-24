local existed, gitsigns = pcall(require, "gitsigns")

if not existed then
  return
end

gitsigns.setup()
