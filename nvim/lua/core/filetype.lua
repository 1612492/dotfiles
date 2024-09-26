vim.filetype.add({
  pattern = {
    ["%.env%.[%w_.-]+"] = "sh",
  },
})

vim.filetype.add({
  extension = {
    tact = "tact",
  },
})
