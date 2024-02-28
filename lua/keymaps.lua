local M = {}

vim.g.mapleader = " "

local opts = { noremap = true, silent = true }

M.setup = function()
  -- Telescope
  vim.keymap.set('n', '<leader>ff', '<CMD>Telescope find_files<CR>', opts)
  vim.keymap.set('n', '<leader>fd', '<CMD>Telescope treesitter<CR>', opts)

  -- LSP
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
end

return M
