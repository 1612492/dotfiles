vim.g.mapleader = " "

local opts = { noremap=true, silent=true }
local map = vim.api.nvim_set_keymap

-- nvim-tree.lua
map("n","<leader>e",":NvimTreeToggle<CR>", opts)

-- nvim-lspconfig
map('n', "gd", '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map("n", "gf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

-- telescope.nvim
map("n", "<leader>f", "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)
map("n", "<leader>g", "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
map("n", "<leader>b", "<cmd>lua require('telescope.builtin').buffers()<CR>", opts)
map("n", "gi", "<cmd>lua require('telescope.builtin').lsp_implementations()<CR>", opts)
map("n", "gr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>", opts)

-- nvim-bufferline
map("n", "<leader>1", "<cmd>lua require('bufferline').go_to_buffer(1)<CR>", opts)
map("n", "<leader>2", "<cmd>lua require('bufferline').go_to_buffer(2)<CR>", opts)
map("n", "<leader>3", "<cmd>lua require('bufferline').go_to_buffer(3)<CR>", opts)
map("n", "<leader>4", "<cmd>lua require('bufferline').go_to_buffer(4)<CR>", opts)
map("n", "<leader>5", "<cmd>lua require('bufferline').go_to_buffer(5)<CR>", opts)
map("n", "<leader>6", "<cmd>lua require('bufferline').go_to_buffer(6)<CR>", opts)
map("n", "<leader>7", "<cmd>lua require('bufferline').go_to_buffer(7)<CR>", opts)
map("n", "<leader>8", "<cmd>lua require('bufferline').go_to_buffer(8)<CR>", opts)
map("n", "<leader>9", "<cmd>lua require('bufferline').go_to_buffer(9)<CR>", opts)
map("n", "<leader>0", "<cmd>lua require('bufferline').go_to_buffer(10)<CR>", opts)

-- lspsaga
map("n", "[d", "<cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_prev()<CR>", opts)
map("n", "]d", "<cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_next()<CR>", opts)
map("n", "K", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", opts)
map("n", "R", "<cmd>lua require('lspsaga.rename').rename()<CR>", opts)
map("n", "<leader>a", "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", opts)
map("n", "<leader>t", "<cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR>", opts)
map("t", "<c-d>", "<cmd>lua require('lspsaga.floaterm').close_float_terminal()<CR>", opts)
map("n", "gh", "<cmd>lua require('lspsaga.provider').lsp_finder()<CR>", opts)

-- vsnip
map("i", "<c-j>", "vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-j>'", { expr = true })
