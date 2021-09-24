local utils = require("utils")
local existed, lspsaga = pcall(require, "lspsaga")

if not existed then
  return
end

lspsaga.init_lsp_saga({
  error_sign = ' ',
  warn_sign = ' ',
  hint_sign = ' ',
  infor_sign = ' ',
})

utils.set_key_map("n", "<leader>t", "<cmd>lua require('lspsaga.floaterm').open_float_terminal()<cr>")
utils.set_key_map("t", "<c-d>", "<cmd>lua require('lspsaga.floaterm').close_float_terminal()<cr>")
