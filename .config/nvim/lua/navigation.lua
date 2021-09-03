vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_width_allow_resize  = 1
vim.g.nvim_tree_lsp_diagnostics = 1
vim.g.nvim_tree_icon_padding = ' '
vim.g.nvim_tree_update_cwd = 1
vim.g.nvim_tree_special_files = {}

function NvimTreeOSOpen()
  local lib = require "nvim-tree.lib"
  local node = lib.get_node_at_cursor()
  if node then
    vim.fn.jobstart("open '" .. node.absolute_path .. "' &", {detach = true})
  end
end

vim.g.nvim_tree_bindings = {{ key = "o", cb = ":lua NvimTreeOSOpen()<CR>" }}

require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<C-f>"] = require("telescope.actions").cycle_history_next,
        ["<C-b>"] = require("telescope.actions").cycle_history_prev,
      },
    },
  },
}
