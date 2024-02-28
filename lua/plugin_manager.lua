local M = {}

local utils = require("utils")

M.init = function(options)
  options = options or {}

  local lazypath = utils.join_paths(vim.fn.stdpath("data"), "lazy", "lazy.nvim")

  if not utils.is_dir(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--branch=stable",
      "https://github.com/folke/lazy.nvim.git",
      lazypath,
    })
  end

  vim.opt.rtp:prepend(lazypath)
end

M.load = function(path)
  local lazy_available, lazy = pcall(require, "lazy")

  if not lazy_available then
    vim.api.nvim_err_writeln("Lazy not available...")
  end

  local specs_available, specs = pcall(require, path)

  if not specs_available then
    vim.api.nvim_err_writeln("Failed to load plugins specs...")
  end

  lazy.setup(specs)
end

return M
