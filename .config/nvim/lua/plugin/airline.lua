vim.g.airline_theme = 'dark_dimmed'
vim.g.airline_filetype_overrides = { ['coc-explorer'] = {'', ''}}
vim.g.airline_section_c = '%t'
vim.g['airline#extensions#ale#enabled'] = 1
vim.g['airline#extensions#hunks#enabled'] = 0
vim.g['airline#extensions#default#layout'] = { { 'a', 'b', 'c' }, { 'x', 'z', 'error', 'warning' } }
