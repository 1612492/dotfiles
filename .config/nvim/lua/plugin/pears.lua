local existed, pears = pcall(require, "pears")

if not existed then
  return
end

pears.setup(function(config)
  config.preset("tag_matching")
end)
