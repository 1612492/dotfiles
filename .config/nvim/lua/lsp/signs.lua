local signs = {
  { DiagnosticSignError = " " },
  { DiagnosticSignWarn = " " },
  { DiagnosticSignInfo = " " },
  { DiagnosticSignHint = " " },
}

for _, sign in ipairs(signs) do
  for type, icon in pairs(sign) do
    vim.fn.sign_define(type, { text = icon, texthl = type })
  end
end
