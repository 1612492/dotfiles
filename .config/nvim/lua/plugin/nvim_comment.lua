local existed, nvim_comment = pcall(require, "nvim_comment")

if not existed then
  return
end

nvim_comment.setup({
  hook = function()
    require("ts_context_commentstring.internal").update_commentstring()
  end,
})
