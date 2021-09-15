local utils = require("utils")

if not utils.is_valid("surround.nvim") then
  return
end

require("surround").setup({
  mappings_style = "sandwich"
})
