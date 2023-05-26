local M = {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		build = ":MasonUpdate",
		config = function()
			require("plugins.lsp.lspconfig")
		end,
	},
	{
		"glepnir/lspsaga.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"nvim-tree/nvim-web-devicons",
			--Please make sure you install markdown and markdown_inline parser
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("plugins.lsp.lspsaga")
		end,
	},
}

return M
