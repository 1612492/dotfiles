local utils = require("utils")

if not utils.is_valid("gitsigns.nvim") then
  return
end

require("gitsigns").setup()
