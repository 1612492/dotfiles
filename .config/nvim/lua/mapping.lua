vim.g.mapleader = " "

local opts = { noremap=true, silent=true }
local map = vim.api.nvim_set_keymap

-- nvim-tree.lua
map("n","<leader>e",":NvimTreeToggle<CR>", opts)

-- nvim-lspconfig
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
map("n", "gy", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
map("n", "gf", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)
map("v", "gf", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)

-- auto-pairs
map("n", "<leader>=", "<cmd>lua require'nvim-autopairs'.disable()<cr>", opts)
map("v", "<leader>=", "<cmd>lua require'nvim-autopairs'.enable()<cr>", opts)

-- telescope.nvim
map("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
map("n", "<leader>g", "<cmd>Telescope live_grep<cr>", opts)
map("n", "<leader>b", "<cmd>Telescope buffers<cr>", opts)

-- nvim-bufferline
map("n", "gb", "<cmd>BufferLinePick<cr>", opts)

-- lspsaga
map("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
map("n", "]d", "<cmd>Lspsaga diagnostic_jump_nex<cr>", opts)
map("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
map("n", "gR", "<cmd>Lspsaga rename<cr>", opts)
map("n", "<leader>a", "<cmd>Lspsaga code_action<cr>", opts)
map("n", "<leader>t", "<cmd>Lspsaga open_floaterm<cr>", opts)
map("t", "<c-d>", "<cmd>Lspsaga close_floaterm<cr>", opts)
