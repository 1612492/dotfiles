vim.cmd[[
let g:vsnip_snippet_dir = expand('~/.config/nvim/snippet')
let g:vsnip_filetypes = {}
let g:vsnip_filetypes.typescript = [ 'javascript' ]
let g:vsnip_filetypes.javascriptreact = [ 'javascript' ]
let g:vsnip_filetypes.typescriptreact = [ 'typescript' ]
imap <expr> <C-j> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-j>'
]]
