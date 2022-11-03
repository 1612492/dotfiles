local keymap = vim.keymap.set
local default_opts = { noremap = true, silent = true }

local M = {}

function M.set_key_map(mode, key, cmd, opts)
  opts = opts or default_opts
  keymap(mode, key, cmd, opts)
end

return M
