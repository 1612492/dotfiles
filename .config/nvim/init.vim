au ColorScheme * hi Normal ctermbg=none guibg=none
au ColorScheme * hi SignColumn ctermbg=none guibg=none
"Plugins
call plug#begin('~/.config/nvim/bundle')
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'Yggdroot/indentLine'
Plug 'psliwka/vim-smoothie'
Plug 'tpope/vim-commentary'
Plug 'alvan/vim-closetag'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-surround'
Plug 'qpkorr/vim-bufkill'
call plug#end()

" Settings
syntax on
let g:material_theme_style = 'palenight'
colorscheme material
set termguicolors
set background=dark
set encoding=UTF-8
set mouse=a
set shiftwidth=2
set softtabstop=2
set expandtab
set cursorline
set hlsearch
set incsearch
set smartindent
set smartcase
set number
set relativenumber
set splitbelow
set splitright
set hidden
set nobackup
set nowritebackup
set signcolumn=yes
set foldmethod=indent
set nofoldenable
set foldnestmax=1

" Plugin settings
let mapleader = " "
let g:coc_global_extensions = [
      \'coc-explorer',
      \'coc-git',
      \'coc-highlight',
      \'coc-lists',
      \'coc-marketplace',
      \'coc-pairs',
      \'coc-prettier',
      \'coc-snippets',
      \'coc-yank',
      \'coc-tsserver',
      \'coc-html',
      \'coc-css',
      \'coc-json',
      \'coc-styled-components',
      \'coc-flutter-tools'
      \]
let g:airline_theme = 'material'
let g:airline_filetype_overrides = {'coc-explorer':  [ 'Explorer', '' ]}
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#default#layout = [['a', 'b', 'c'],['x', 'z', 'error', 'warning']]
let g:closetag_filenames = '*.html,*.jsx,*.tsx,*.js'
let g:indentLine_fileTypeExclude=['coc-explorer']
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'

" Key bindings
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
imap <C-j> <Plug>(coc-snippets-expand-jump)

nmap <silent> <leader>f :CocList files<CR>
nmap <silent> <leader>b :CocList --normal buffers<CR>
nmap <silent> <leader>g :CocList grep<CR>
nmap <silent> <leader>e :CocCommand explorer<CR>
nmap <silent> <leader>y :CocList -A --normal yank<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
nmap [c <Plug>(coc-git-prevconflict)
nmap ]c <Plug>(coc-git-nextconflict)
