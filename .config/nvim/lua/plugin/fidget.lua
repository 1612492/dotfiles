local existed, fidget = pcall(require, "fidget")

if not existed then
  return
end

fidget.setup({
  window = {
    blend = 0,
  },
})
