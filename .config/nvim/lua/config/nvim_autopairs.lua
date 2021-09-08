local utils = require("utils")

if not utils.is_valid("nvim-autopairs") then
  return
end

require("nvim-autopairs").setup()
