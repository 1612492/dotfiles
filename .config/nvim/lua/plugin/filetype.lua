local existed, filetype = pcall(require, "filetype")

if not existed then
  return
end

filetype.setup({
  overrides = {
    extensions = {
      sol = "solidity",
    },
  },
})
