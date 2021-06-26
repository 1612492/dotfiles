vim.g.mapleader = " "

local opts = { noremap=true, silent=true }
local map = vim.api.nvim_set_keymap

-- nvim-tree.lua
map("n","<leader>e",":NvimTreeToggle<CR>", opts)

-- nvim-lspconfig
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
map("n", "gy", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
map("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
map("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)

-- telescope.nvim
map("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
map("n", "<leader>g", "<cmd>Telescope live_grep<cr>", opts)
map("n", "<leader>b", "<cmd>Telescope buffers<cr>", opts)

-- nvim-bufferline
map("n", "<leader>p", "<cmd>BufferLinePick<cr>", opts)

-- lspsaga
map("n", "gp", "<cmd>Lspsaga preview_definition<cr>", opts)
map("n", "gf", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)
map("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
map("n", "R", "<cmd>Lspsaga rename<cr>", opts)
map("n", "<c-t>", "<cmd>Lspsaga open_floaterm<cr>", opts)
map("t", "<c-t>", "<cmd>Lspsaga close_floaterm<cr>", opts)
map("n", "<leader>a", "<cmd>Lspsaga code_action<cr>", opts)
map("v", "<leader>a", "<cmd><c-u>Lspsaga range_code_action<cr>", opts)

-- trouble
map("n", "<leader>t", "<cmd>TroubleToggle<cr>", opts)

-- bufferline
map("n", "P", "<cmd>BufferLinePick<cr>", opts)
