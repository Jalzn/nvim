local options = require("options")
local keymaps = require("keymaps")
local plugin_manager = require("plugin_manager")

local M = {}

M.bootstrap = function()
  plugin_manager.init()

  options.setup()
  keymaps.setup()

  plugin_manager.load("plugins")
end

return M
