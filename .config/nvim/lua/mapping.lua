vim.g.mapleader = ' '

vim.api.nvim_set_keymap('n','<leader>e',':CocCommand explorer<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n','<leader>b',':CocList buffers<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n','<leader>g',':CocList grep<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n','<leader>f',':CocList files<cr>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', {})
vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', {})
vim.api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', {})
vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', {})

vim.api.nvim_set_keymap('n', '[g', '<Plug>(coc-git-prevchunk)', {})
vim.api.nvim_set_keymap('n', ']g', '<Plug>(coc-git-nextchunk)', {})
vim.api.nvim_set_keymap('n', '[c', '<Plug>(coc-git-prevconflict)', {})
vim.api.nvim_set_keymap('n', ']c', '<Plug>(coc-git-nextconflict)', {})

vim.api.nvim_set_keymap('i', '<c-l>', '<Plug>(coc-snippets-expand)',{})
vim.api.nvim_set_keymap('v', '<c-j>', '<Plug>(coc-snippets-select)',{})
vim.api.nvim_set_keymap('i', '<c-j>', '<Plug>(coc-snippets-expand-jump)',{})

vim.api.nvim_set_keymap('x', '<leader>a', '<Plug>(coc-codeaction-selected)',{})
vim.api.nvim_set_keymap('n', '<leader>a', '<Plug>(coc-codeaction-selected)',{})

vim.api.nvim_set_keymap('x', 'if', '<Plug>(coc-funcobj-i)',{})
vim.api.nvim_set_keymap('o', 'if', '<Plug>(coc-funcobj-i)',{})
vim.api.nvim_set_keymap('x', 'af', '<Plug>(coc-funcobj-a)',{})
vim.api.nvim_set_keymap('o', 'af', '<Plug>(coc-funcobj-a)',{})

vim.api.nvim_set_keymap('x', 'ic', '<Plug>(coc-classobj-i)',{})
vim.api.nvim_set_keymap('o', 'ic', '<Plug>(coc-classobj-i)',{})
vim.api.nvim_set_keymap('x', 'ac', '<Plug>(coc-classobj-a)',{})
vim.api.nvim_set_keymap('o', 'ac', '<Plug>(coc-classobj-a)',{})

vim.api.nvim_set_keymap('i', '<cr>', "pumvisible() ? '<c-y>' : '<cr>'", {noremap = true, expr = true})
