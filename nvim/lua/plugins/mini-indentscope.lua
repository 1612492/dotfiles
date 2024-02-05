return {
  "echasnovski/mini.indentscope",
  opts = function()
    return {
      symbol = "│",
      draw = {
        animation = require("mini.indentscope").gen_animation.none(),
      },
    }
  end,
}
