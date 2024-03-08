local M = {}

local default_options = {
  background = "dark",
  backup = false,
  clipboard = "unnamedplus",
  colorcolumn = "80",
  cmdheight = 0,
  cursorline = true,
  expandtab = false,
  fileencoding = "utf-8",
  hlsearch = true,
  ignorecase = true,
  number = true,
  relativenumber = true,
  scrolloff = 8,
  shiftwidth = 2,
  sidescrolloff = 8,
  signcolumn = "yes",
  splitbelow = true,
  splitright = true,
  swapfile = false,
  tabstop = 2,
  softtabstop = 2,
  termguicolors = true,
  timeout = true,
  timeoutlen = 300,
  title = true,
  wrap = false,
}

M.setup = function()
  for k, v in pairs(default_options) do
    vim.opt[k] = v
  end
end

return M
