---@type ChadrcConfig

vim.g.python3_host_prog = "/home/rhohen/.pyenv/shims/python"

local enable_providers = {
      "python3_provider",
}
    
for _, plugin in pairs(enable_providers) do
  vim.g["loaded_" .. plugin] = nil
  vim.cmd("runtime " .. plugin)
end


local M = {}
M.ui = { theme = 'doomchad' }
M.plugins = 'custom.plugins'
M.mappings = require "custom.mappings"
return M
