vim.g.airline_theme = 'dark_dimmed'
vim.g.airline_filetype_overrides = { ['coc-explorer'] = {'', ''}}
vim.g['airline#extensions#ale#enabled'] = 1
vim.g['airline#extensions#hunks#enabled'] = 0
vim.g['airline#extensions#default#layout'] = { { 'a', 'b', 'c' }, { 'x', 'z', 'error', 'warning' } }
vim.g['airline#extensions#tabline#buffer_idx_mode'] = 1
vim.g['airline#extensions#tabline#buffers_label'] = ''
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['airline#extensions#tabline#left_sep'] = ' '
vim.g['airline#extensions#tabline#left_alt_sep'] = ' '
vim.g['airline#extensions#tabline#show_buffers'] = 1
