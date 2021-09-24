local existed, neoscroll = pcall(require, "neoscroll")

if not existed then
  return
end

neoscroll.setup()
