local options = {
  encoding = "utf-8",
  expandtab = true,
  shiftwidth = 2,
  smartindent = true,
  tabstop = 2,
  softtabstop = 2,
  hlsearch = true,
  incsearch = true,
  ignorecase = true,
  smartcase = true,
  mouse = "",
  cursorline = true,
  signcolumn = "yes",
  number = true,
  relativenumber = true,
  splitbelow = true,
  splitright = true,
  showmode = false,
  termguicolors = true,
  foldmethod = "expr",
  foldexpr = "v:lua.vim.treesitter.foldexpr()",
  foldenable = true,
  foldlevel = 99,
  swapfile = false,
  writebackup = false,
}

for name, value in pairs(options) do
  vim.opt[name] = value
end
