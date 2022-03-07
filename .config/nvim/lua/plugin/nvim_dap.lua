local utils = require("utils")
local existed, dap = pcall(require, "dap")

if not existed then
  return
end

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "", linehl = "", numhl = "" })
require("dapui").setup()
require("dap-go").setup()
require("dap.ext.vscode").load_launchjs()

dap.adapters.go = function(callback, config)
  local stdout = vim.loop.new_pipe(false)
  local handle
  local pid_or_err
  local port = 38697
  local opts = {
    stdio = { nil, stdout },
    args = { "dap", "-l", "127.0.0.1:" .. port },
    detached = true,
  }
  handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
    stdout:close()
    handle:close()
    if code ~= 0 then
      print("dlv exited with code", code)
    end
  end)
  assert(handle, "Error running dlv: " .. tostring(pid_or_err))
  stdout:read_start(function(err, chunk)
    assert(not err, err)
    if chunk then
      vim.schedule(function()
        require("dap.repl").append(chunk)
      end)
    end
  end)
  -- Wait for delve to start
  vim.defer_fn(function()
    callback({ type = "server", host = "127.0.0.1", port = port })
  end, 100)
end

dap.configurations.go = {
  {
    type = "go",
    name = "Debug",
    request = "launch",
    program = "${file}",
  },
  {
    type = "go",
    name = "Debug test",
    request = "launch",
    mode = "test",
    program = "${file}",
  },
  {
    type = "go",
    name = "Debug test (go.mod)",
    request = "launch",
    mode = "test",
    program = "./${relativeFileDirname}",
  },
}

utils.set_key_map("n", "<F5>", ":lua require'dap'.continue()<CR>")
utils.set_key_map("n", "<F9>", ":lua require'dap'.toggle_breakpoint()<CR>")
utils.set_key_map("n", "<F10>", ":lua require'dap'.step_over()<CR>")
utils.set_key_map("n", "<F11>", ":lua require'dap'.step_into()<CR>")
utils.set_key_map("n", "<F12>", ":lua require'dap'.step_out()<CR>")
utils.set_key_map("n", "<leader>d", ":lua require'dapui'.toggle()<CR>")
