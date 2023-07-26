return function()
  local oil = require("oil")

  oil.setup({
    delete_to_trash = true,
    trash_command = "trash",
    keymaps = {
      ["gx"] = function()
        local cwd = oil.get_current_dir()
        local entry = oil.get_cursor_entry()

        if cwd and entry then
          vim.fn.jobstart({ "open", string.format("%s/%s", cwd, entry.name) })
        end
      end,
    },
  })
end
