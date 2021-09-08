local utils = require("utils")

if not utils.is_valid("neogit") then
  return
end

require('neogit').setup {
  signs = {
    section = { "", "" },
    item = { "", "" },
    hunk = { "", "" },
  },
  integrations = {
    diffview = true  
  },
}
