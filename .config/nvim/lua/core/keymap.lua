local map = vim.keymap.set

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
