local loader = {}
loader.handles = {}

function loader:init()
  local group = vim.api.nvim_create_augroup("CodeCompanionFidgetHooks", { clear = true })

  vim.api.nvim_create_autocmd({ "User" }, {
    pattern = "CodeCompanionRequestStarted",
    group = group,
    callback = function(request)
      local handle = loader:create_progress_handle(request)
      loader:store_progress_handle(request.data.id, handle)
    end,
  })

  vim.api.nvim_create_autocmd({ "User" }, {
    pattern = "CodeCompanionRequestFinished",
    group = group,
    callback = function(request)
      local handle = loader:pop_progress_handle(request.data.id)
      if handle then
        loader:report_exit_status(handle, request)
        handle:finish()
      end
    end,
  })
end

function loader:store_progress_handle(id, handle)
  self.handles[id] = handle
end

function loader:pop_progress_handle(id)
  local handle = self.handles[id]
  self.handles[id] = nil
  return handle
end

function loader:create_progress_handle(request)
  return require("fidget.progress").handle.create({
    title = "Requesting assistance (" .. request.data.strategy .. ")",
    message = "In progress...",
    lsp_client = {
      name = self:llm_role_title(request.data.adapter),
    },
  })
end

function loader:llm_role_title(adapter)
  local parts = {}
  table.insert(parts, adapter.formatted_name)
  if adapter.model and adapter.model ~= "" then
    table.insert(parts, "(" .. adapter.model .. ")")
  end
  return table.concat(parts, " ")
end

function loader:report_exit_status(handle, request)
  if request.data.status == "success" then
    handle.message = "Completed"
  elseif request.data.status == "error" then
    handle.message = " Error"
  else
    handle.message = "󰜺 Cancelled"
  end
end

return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "j-hui/fidget.nvim",
  },
  opts = {
    strategies = {
      chat = { adapter = "gemini" },
      inline = { adapter = "gemini" },
      agent = { adapter = "gemini" },
    },
    adapters = {
      gemini = function()
        return require("codecompanion.adapters").extend("gemini", {
          api_key = function()
            return os.getenv("GEMINI_API_KEY")
          end,
        })
      end,
    },
  },
  init = function()
    loader:init()
  end,
}
