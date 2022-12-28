local icons = require("icons")

local signs = {
  { DiagnosticSignError = icons.Error },
  { DiagnosticSignWarn = icons.Warn },
  { DiagnosticSignInfo = icons.Info },
  { DiagnosticSignHint = icons.Hint },
}

for _, sign in ipairs(signs) do
  for type, sign in pairs(sign) do
    vim.fn.sign_define(type, { text = sign, texthl = type })
  end
end
