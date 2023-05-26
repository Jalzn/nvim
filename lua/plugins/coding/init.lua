local M = {
	{
		"hrsh7th/nvim-cmp",
		event = "BufEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			require("plugins.coding.cmp")
		end,
	},
	{
		"echasnovski/mini.surround",
		config = function()
			require("mini.surround").setup()
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},
	{
		"lvimuser/lsp-inlayhints.nvim",
		branch = "anticonceal",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("lsp-inlayhints").setup()
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("lsp_signature").setup()
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
}

return M
