vim.api.nvim_create_autocmd("BufWritePost", { pattern = "packer_init.lua", command = "source <afile> | PackerSync" })
vim.api.nvim_create_autocmd("BufRead", { pattern = "*/node_modules/*", command = "lua vim.diagnostic.disable(0)" })
vim.api.nvim_create_autocmd("BufNewFile", { pattern = "*/node_modules/*", command = "lua vim.diagnostic.disable(0)" })
