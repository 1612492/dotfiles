vim.g.mapleader = ' '

vim.api.nvim_set_keymap('n','<leader>e',':CocCommand explorer<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n','<leader>g',':CocList grep<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n','<leader>f',':CocList files<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n','<leader>c',':CocList commands<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n','<leader>r',':CocListResume<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n','<leader>bl',':CocList buffers<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n','<leader>ba',':%bd|e#|bd#<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n','<leader>bd',':bp|bd#<cr>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', {})
vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', {})
vim.api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', {})
vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', {})

vim.api.nvim_set_keymap('n', '[g', '<Plug>(coc-git-prevchunk)', {})
vim.api.nvim_set_keymap('n', ']g', '<Plug>(coc-git-nextchunk)', {})
vim.api.nvim_set_keymap('n', '[c', '<Plug>(coc-git-prevconflict)', {})
vim.api.nvim_set_keymap('n', ']c', '<Plug>(coc-git-nextconflict)', {})

vim.api.nvim_set_keymap('x', '<leader>a', '<Plug>(coc-codeaction-selected)',{})
vim.api.nvim_set_keymap('n', '<leader>a', '<Plug>(coc-codeaction-selected)',{})

vim.api.nvim_set_keymap('x', 'if', '<Plug>(coc-funcobj-i)',{})
vim.api.nvim_set_keymap('o', 'if', '<Plug>(coc-funcobj-i)',{})
vim.api.nvim_set_keymap('x', 'af', '<Plug>(coc-funcobj-a)',{})
vim.api.nvim_set_keymap('o', 'af', '<Plug>(coc-funcobj-a)',{})

vim.api.nvim_set_keymap('i', '<cr>', "pumvisible() ? '<c-y>' : '<cr>'", {noremap = true, expr = true})

-- Buffers
vim.api.nvim_set_keymap('n', '<leader>1', '<Plug>AirlineSelectTab1', {})
vim.api.nvim_set_keymap('n', '<leader>2', '<Plug>AirlineSelectTab2', {})
vim.api.nvim_set_keymap('n', '<leader>3', '<Plug>AirlineSelectTab3', {})
vim.api.nvim_set_keymap('n', '<leader>4', '<Plug>AirlineSelectTab4', {})
vim.api.nvim_set_keymap('n', '<leader>5', '<Plug>AirlineSelectTab5', {})
vim.api.nvim_set_keymap('n', '<leader>6', '<Plug>AirlineSelectTab6', {})
vim.api.nvim_set_keymap('n', '<leader>7', '<Plug>AirlineSelectTab7', {})
vim.api.nvim_set_keymap('n', '<leader>8', '<Plug>AirlineSelectTab8', {})
vim.api.nvim_set_keymap('n', '<leader>9', '<Plug>AirlineSelectTab9', {})
vim.api.nvim_set_keymap('n', '<leader>0', '<Plug>AirlineSelectTab0', {})
vim.api.nvim_set_keymap('n', '<leader>-', '<Plug>AirlineSelectPrevTab', {})
vim.api.nvim_set_keymap('n', '<leader>+', '<Plug>AirlineSelectNextTab', {})
