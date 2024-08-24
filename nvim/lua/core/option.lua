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
  mouse = "a",
  cursorline = true,
  signcolumn = "yes",
  number = true,
  relativenumber = true,
  splitbelow = true,
  splitright = true,
  pumheight = 10,
  showmode = true,
  termguicolors = true,
  completeopt = "menu,menuone,noselect",
  conceallevel = 0,
  fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]],
  foldmethod = "indent",
  foldcolumn = "0",
  foldenable = true,
  foldlevel = 99,
  foldlevelstart = 99,
  updatetime = 250,
  hidden = true,
  swapfile = false,
  backup = false,
  writebackup = false,
}

vim.filetype.add({
  pattern = {
    ["%.env%.[%w_.-]+"] = "sh",
  },
})

for name, value in pairs(options) do
  vim.opt[name] = value
end
