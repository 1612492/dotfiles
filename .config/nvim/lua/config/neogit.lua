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

utils.key_map("n", "<leader>i", "<cmd>lua require('neogit').open()<CR>")
