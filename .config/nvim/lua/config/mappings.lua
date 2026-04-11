local map = vim.keymap.set

local opts = { silent = true }

map("n", "gf", function()
  require("conform").format()
end, { silent = true })

for i = 1, 9 do
  map("n", ("<leader>%s"):format(i), ("<cmd>BufferGoto %s<cr>"):format(i), opts)
end

map("n", "<leader>0", "<cmd>BufferPick<cr>", opts)
map("n", "<leader>-", "<cmd>BufferClose<cr>", opts)
map("n", "<leader>=", "<cmd>BufferCloseAllButCurrent<cr>", opts)

map("n", "<leader>e", function()
  require("oil").open()
end, opts)

map("n", "<leader>f", Snacks.picker.files, opts)
map("n", "<leader>g", Snacks.picker.grep, opts)

local function copy_to_clipboard(text, message)
  vim.fn.setreg("+", text)
  vim.notify(message, vim.log.levels.INFO)
end

map("n", "<leader>af", function()
  local path = vim.fn.expand("%:.")
  copy_to_clipboard(path, "Copied: " .. path)
end, { desc = "Copy file path", silent = true })

map("v", "<leader>av", function()
  local path = vim.fn.expand("%:.")
  local start_line = vim.fn.line("v")
  local end_line = vim.fn.line(".")

  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end

  local formatted = string.format("%s:%d-%d", path, start_line, end_line)
  copy_to_clipboard(formatted, "Copied: " .. formatted)
end, { desc = "Copy file path with range", silent = true })

map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
