vim.g.airline_theme = 'github'
-- vim.g.airline_theme = 'material'
vim.g.airline_filetype_overrides = { ['coc-explorer'] = {'explorer', ''}}
vim.g['airline#extensions#ale#enabled'] = 1
vim.g['airline#extensions#hunks#enabled'] = 0
vim.g['airline#extensions#default#layout'] = { { 'a', 'b', 'c' }, { 'x', 'z', 'error', 'warning' } }
