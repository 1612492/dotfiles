local utils = require("utils")
local existed, aerial = pcall(require, "aerial")

if not existed then
  return
end

aerial.setup({
  min_width = 30,
})

utils.set_key_map("n", "<leader>t", "<cmd>AerialToggle!<CR>", {})
