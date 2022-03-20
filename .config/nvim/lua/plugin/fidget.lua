local existed, fidget = pcall(require, "fidget")

if not existed then
  return
end

fidget.setup({
  window = {
    blend = 0,
  },
})

vim.cmd([[
hi! FidgetTitle ctermbg=NONE guibg=NONE
hi! FidgetTask ctermbg=NONE guibg=NONE
]])
