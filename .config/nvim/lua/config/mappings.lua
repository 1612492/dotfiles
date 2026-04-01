local map = vim.keymap.set

map("n", "gf", function()
  require("conform").format()
end, { silent = true })

for i = 1, 9 do
  map("n", ("<leader>%s"):format(i), ("<cmd>BufferGoto %s<cr>"):format(i), { silent = true })
end

map("n", "<leader>0", "<cmd>BufferPick<cr>", { silent = true })
map("n", "<leader>-", "<cmd>BufferClose<cr>", { silent = true })
map("n", "<leader>=", "<cmd>BufferCloseAllButCurrent<cr>", { silent = true })

map("n", "<leader>e", function()
  require("oil").open()
end, { silent = true })

map("n", "<leader>f", function()
  require("snacks").picker.files()
end, { silent = true })

map("n", "<leader>g", function()
  require("snacks").picker.grep()
end, { silent = true })

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
