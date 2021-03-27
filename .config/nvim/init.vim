let mapleader = " "
au ColorScheme * hi Normal ctermbg=none guibg=none
au ColorScheme * hi SignColumn ctermbg=none guibg=none
"Plugins
call plug#begin('~/.config/nvim/bundle')
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'Yggdroot/indentLine'
Plug 'psliwka/vim-smoothie'
Plug 'tpope/vim-commentary'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'qpkorr/vim-bufkill'
Plug 'dense-analysis/ale'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'sheerun/vim-polyglot'
Plug 'mbbill/undotree'
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
let g:airline_filetype_overrides = {'coc-explorer':  [ 'Explorer', '' ]}
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#default#layout = [['a', 'b', 'c'],['x', 'z', 'error', 'warning']]
let g:airline_theme = 'material'
let g:coc_global_extensions = [
      \'coc-explorer',
      \'coc-git',
      \'coc-highlight',
      \'coc-lists',
      \'coc-marketplace',
      \'coc-pairs',
      \'coc-snippets',
      \'coc-prettier',
      \'coc-yank',
      \'coc-tsserver',
      \'coc-html',
      \'coc-css',
      \'coc-json',
      \'coc-styled-components',
      \'coc-flutter-tools'
      \]
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
let g:closetag_filenames = '*.html,*.jsx,*.tsx,*.js'
let g:indentLine_fileTypeExclude=['coc-explorer']

lua require('nvim-bufferline')

" Key bindings
imap <c-l> <Plug>(coc-snippets-expand)
vmap <c-j> <Plug>(coc-snippets-select)
imap <c-j> <Plug>(coc-snippets-expand-jump)

nmap <silent> <leader>e :CocCommand explorer<cr>
nmap <silent> <leader>f :CocList files<cr>
nmap <silent> <leader>b :CocList --normal buffers<cr>
nmap <silent> <leader>g :CocList grep<cr>
nmap <silent> <leader>u :UndotreeToggle<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
nmap [c <Plug>(coc-git-prevconflict)
nmap ]c <Plug>(coc-git-nextconflict)

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<cr>"
