local existed, nvim_autopairs = pcall(require, "nvim-autopairs")

if not existed then
  return
end

nvim_autopairs.setup()
