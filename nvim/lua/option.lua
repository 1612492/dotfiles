local opt = vim.opt

vim.g.mapleader = " "

opt.encoding = "utf-8"
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

opt.cursorline = true
opt.signcolumn = "yes"
opt.number = true
opt.relativenumber = true
opt.splitbelow = true
opt.splitright = true
opt.pumheight = 10
opt.showmode = false
opt.termguicolors = true

opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 0

opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
opt.foldcolumn = "1"
opt.foldenable = true
opt.foldlevel = 99
opt.foldlevelstart = 99

opt.updatetime = 250
opt.hidden = true
opt.swapfile = false
opt.backup = false
opt.writebackup = false
