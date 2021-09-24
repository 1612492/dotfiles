local existed, _ = pcall(require, "luasnip")

if not existed then
  return
end

require("luasnip/loaders/from_vscode").load()
