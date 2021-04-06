vim.g.ale_linters = {
  javascript = { 'eslint' },
  typescript = { 'eslint' },
  javascriptreact = { 'eslint'},
  typescriptreact = { 'eslint' },
}
vim.g.ale_fixers = {
  ['*'] = { 'remove_trailing_lines', 'trim_whitespace' },
  javascript = { 'eslint' },
  typescript = { 'eslint' },
  javascriptreact = { 'eslint'},
  typescriptreact = { 'eslint' },
}
vim.g.ale_fix_on_save = 1
vim.g.ale_sign_error = ' '
vim.g.ale_sign_warning = ''
