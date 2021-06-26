require("dapui").setup()
local dap = require('dap')

dap.adapters.chrome = {
  type = "executable",
  command = "node",
  args = { "/Users/phatvo/.config/nvim/debugger/vscode-chrome-debug/out/src/chromeDebug.js" }
}

dap.configurations.javascript = {
  {
    type = "chrome",
    request = "attach",
    program = "${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    webRoot = "${workspaceFolder}"
  }
}
