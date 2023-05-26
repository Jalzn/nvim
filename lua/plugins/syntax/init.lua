local M = {
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("plugins.syntax.treesitter")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
}

return M
