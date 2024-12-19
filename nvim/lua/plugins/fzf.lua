return {
  "ibhagwan/fzf-lua",
  version = false,
  keys = {
    {
      "<leader>f",
      function()
        require("fzf-lua").files()
      end,
    },
    {
      "<leader>g",
      function()
        require("fzf-lua").live_grep()
      end,
    },
  },
  opts = function()
    local actions = require("fzf-lua.actions")

    return {
      "default-title",
      fzf_colors = true,
      keymap = {
        builtin = {
          false,
          ["<F1>"] = "toggle-help",
          ["<C-d>"] = "preview-down",
          ["<c-u>"] = "preview-up",
        },
        fzf = {
          false,
          ["ctrl-c"] = "abort",
          ["ctrl-f"] = "half-page-down",
          ["ctrl-b"] = "half-page-up",
        },
      },
      actions = {
        files = {
          false,
          ["enter"] = actions.file_edit_or_qf,
          ["ctrl-s"] = actions.file_split,
          ["ctrl-v"] = actions.file_vsplit,
          ["ctrl-q"] = actions.file_sel_to_qf,
        },
      },
      previewers = {
        builtin = {
          extensions = {
            ["gif"] = { "viu", "-b" },
            ["jpeg"] = { "viu", "-b" },
            ["jpg"] = { "viu", "-b" },
            ["png"] = { "viu", "-b" },
            ["svg"] = { "viu", "-b" },
            ["webp"] = { "viu", "-b" },
          },
        },
      },
      files = {
        cwd_prompt = false,
        actions = {
          ["ctrl-g"] = { actions.toggle_ignore },
          ["ctrl-h"] = { actions.toggle_hidden },
        },
      },
    }
  end,
}
