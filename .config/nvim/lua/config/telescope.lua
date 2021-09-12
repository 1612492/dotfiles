local utils = require("utils")

if not utils.is_valid("telescope.nvim") then
  return
end

require("telescope").setup {
  defaults = {
    prompt_prefix = "   ",
    selection_caret = "  ",
    mappings = {
      i = {
        ["<C-f>"] = require("telescope.actions").cycle_history_next,
        ["<C-b>"] = require("telescope.actions").cycle_history_prev,
      }
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = false,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    project = {
      base_dirs = {
        '~/Documents/tssocial',
        '~/Projects',
      }
    }
  }
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('project')

utils.key_map("n", "<leader>f", "<cmd>lua require('telescope.builtin').find_files()<CR>")
utils.key_map("n", "<leader>g", "<cmd>lua require('telescope.builtin').live_grep()<CR>")
utils.key_map("n", "<leader>p", "<cmd>lua require('telescope').extensions.project.project{}<CR>")