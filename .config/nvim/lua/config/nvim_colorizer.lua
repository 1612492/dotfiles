local utils = require("utils")

if not utils.is_valid("nvim-colorizer.lua") then
  return
end

require("colorizer").setup()
