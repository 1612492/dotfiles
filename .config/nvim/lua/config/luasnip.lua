local utils = require("utils")

if not utils.is_valid("LuaSnip") then
  return
end

require("luasnip/loaders/from_vscode").load()
