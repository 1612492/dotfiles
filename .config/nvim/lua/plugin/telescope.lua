local utils = require("utils")
local existed, telescope = pcall(require, "telescope")

if not existed then
  return
end

telescope.setup({
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    file_ignore_patterns = { "^.git/", "^node_modules/" },
    prompt_prefix = "   ",
    selection_caret = "  ",
    layout_config = {
      horizontal = {
        preview_width = 0.55,
      },
      width = 0.95,
      height = 0.95,
      preview_cutoff = 120,
      vertical = { mirror = false },
    },
    mappings = {
      i = {
        ["<C-f>"] = require("telescope.actions").cycle_history_next,
        ["<C-b>"] = require("telescope.actions").cycle_history_prev,
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    project = {
      base_dirs = {
        "~/Documents/tssocial",
        "~/Projects",
      },
    },
  },
})
require("telescope").load_extension("fzf")
require("telescope").load_extension("project")

utils.set_key_map("n", "<leader>f", "<cmd>lua require('telescope.builtin').find_files({ hidden = true })<CR>")
utils.set_key_map("n", "<leader>g", "<cmd>lua require('telescope.builtin').live_grep()<CR>")
utils.set_key_map("n", "<leader>p", "<cmd>lua require('telescope').extensions.project.project{}<CR>")
