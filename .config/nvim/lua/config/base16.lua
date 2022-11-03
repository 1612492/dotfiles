local status_ok, _ = pcall(require, "base16-colorscheme")

if not status_ok then
  return
end

vim.cmd("colorscheme base16-3024")
