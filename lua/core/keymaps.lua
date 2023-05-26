local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- File Explorer
keymap("n", "<C-e>", "<Cmd>NeoTreeFocus<CR>", opts)

-- Telescope
keymap("n", "<C-f>", "<CMD>Telescope find_files<CR>", opts)

-- Hop
keymap("n", "f", "<CMD>HopChar2<CR>", opts)

-- LSP
keymap("n", "<C-k>", "<CMD>Lspsaga hover_doc<CR>", opts)
keymap("n", "gd", "<CMD>Lspsaga goto_definition<CR>", opts)
keymap("n", "ca", "<CMD>Lspsaga code_action<CR>", opts)
keymap("n", "cd", "<CMD>Lspsaga show_buf_diagnostics<CR>", opts)

-- Buffers
keymap("n", "<A-,>", "<Cmd>BufferLineCyclePrev<CR>", opts)
keymap("n", "<A-.>", "<Cmd>BufferLineCycleNext<CR>", opts)

keymap("n", "<A-<>", "<Cmd>BufferLineMovePrev<CR>", opts)
keymap("n", "<A->>", "<Cmd>BufferLineMoveNext<CR>", opts)

keymap("n", "<A-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", opts)
keymap("n", "<A-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", opts)
keymap("n", "<A-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", opts)
keymap("n", "<A-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", opts)
keymap("n", "<A-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", opts)
keymap("n", "<A-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", opts)
keymap("n", "<A-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", opts)
keymap("n", "<A-8>", "<Cmd>BufferLineGoToBuffer 8<CR>", opts)
keymap("n", "<A-9>", "<Cmd>BufferLineGoToBuffer 9<CR>", opts)

keymap("n", "<A-q>", "<Cmd>Bdelete<CR>", opts)
