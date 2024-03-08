local M = {}

vim.g.mapleader = " "

local opts = { noremap = true, silent = true }

M.setup = function()
  -- Telescope
  vim.keymap.set('n', '<leader>ff', '<CMD>Telescope find_files<CR>', opts)

  -- Harpoon
  vim.keymap.set("n", "<leader>a", function() require("harpoon"):list():append() end)
  vim.keymap.set("n", "<C-e>", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end)

  -- Oil
  vim.keymap.set("n", "<C-p>", "<CMD>Oil --float<CR>", opts)

  -- Aerial
  vim.keymap.set("n", "<leader>fd", "<cmd>AerialNavToggle<CR>")

  -- LSP
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
end

return M
