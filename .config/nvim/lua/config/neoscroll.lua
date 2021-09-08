local utils = require("utils")

if not utils.is_valid("neoscroll.nvim") then
  return
end

require("neoscroll").setup()
