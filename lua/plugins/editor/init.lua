local M = {
	{
		"gennaro-tedesco/nvim-peekup",
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup()
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("telescope").setup()
		end,
	},
	{
		"phaazon/hop.nvim",
		config = function()
			require("plugins.editor.hop")
		end,
	},
	{
		"mhartington/formatter.nvim",
		config = function()
			require("plugins.editor.formatter").setup()
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
}

return M
