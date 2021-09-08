local utils = require("utils")

if not utils.is_valid("diffview.nvim") then
  return
end

require("diffview").setup()
