vim.g.mapleader = " "

local options = {
  backup = false,
  completeopt = "menu,menuone,noselect",
  conceallevel = 0,
  cursorline = true,
  encoding = "utf-8",
  expandtab = true,
  fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]],
  foldcolumn = "1",
  foldenable = true,
  foldlevel = 99,
  foldlevelstart = 99,
  hidden = true,
  hlsearch = true,
  ignorecase = true,
  incsearch = true,
  mouse = "a",
  number = true,
  pumheight = 10,
  relativenumber = true,
  shiftwidth = 2,
  showmode = false,
  signcolumn = "yes",
  smartcase = true,
  smartindent = true,
  softtabstop = 2,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  termguicolors = true,
  writebackup = false,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
