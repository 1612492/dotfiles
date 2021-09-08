local utils = require("utils")

if not utils.is_valid("nvim-comment") then
  return
end

require("nvim_comment").setup({
  hook = function()
    require("ts_context_commentstring.internal").update_commentstring()
  end,
})
