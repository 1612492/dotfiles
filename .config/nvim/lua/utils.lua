local M = {}
local default_opts = { noremap=true, silent=true }

function M.set_key_map(mode, key, cmd, opts)
  opts = opts or default_opts
  vim.api.nvim_set_keymap(mode, key, cmd, opts)
end

function M.buf_set_key_map(buf, mode, key, cmd, opts)
  opts = opts or default_opts
  vim.api.nvim_buf_set_keymap(buf, mode, key, cmd, opts)
end

function M.buf_set_option(buf, key, value)
  vim.api.nvim_buf_set_option(buf, key, value)
end

return M
