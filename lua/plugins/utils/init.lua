local M = {
	{
		"glepnir/dashboard-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("dashboard").setup()
		end,
	},
	{
		"rmagatti/auto-session",
		config = function()
			require("plugins.utils.auto_session")
		end,
	},
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup()
		end,
	},
}

return M
