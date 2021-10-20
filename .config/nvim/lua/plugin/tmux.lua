local existed, tmux = pcall(require, "tmux")

if not existed then
  return
end

tmux.setup({
  copy_sync = {
    enable = true,
  },
  navigation = {
    enable_default_keybindings = true,
  },
  resize = {
    enable_default_keybindings = true,
  },
})
