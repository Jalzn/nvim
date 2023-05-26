local icons = require("core.icons")
local colors = require("plugins.ui.lualine.colors")

local M = {}

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
}

local mode_colors = {
	n = colors.blue,
	i = colors.green,
	v = colors.yellow,
	V = colors.yellow,
	[""] = colors.yellow,
}

M.branch = {
	"branch",
	icon = "",
	color = function()
		local mode = vim.fn.mode()
		return { bg = mode_colors[mode], fg = colors.bg_3 }
	end,
}

M.diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn", "hint" },
	symbols = { error = " ", warn = " ", hint = " " },
	diagnostics_color = {
		color_error = { fg = colors.red },
		color_warn = { fg = colors.yellow },
		color_hint = { fg = colors.aqua },
	},
	always_visible = true,
}

M.lsp = {
	function()
		local default_msg = "Empty"
		local b_filetype = vim.api.nvim_buf_get_option(0, "filetype")
		local clients = vim.lsp.get_active_clients()

		if not next(clients) then
			return default_msg
		end

		for _, client in ipairs(clients) do
			local c_filetypes = client.config.filetypes
			if not c_filetypes then
				return default_msg
			end
			if vim.fn.index(c_filetypes, b_filetype) ~= -1 then
				return client.name
			end
		end
	end,
	icon = " :",
	cond = conditions.buffer_not_empty,
}

M.mode = {
	function()
		local mode = vim.fn.mode()

		local mode_text = {
			n = "Normal",
			i = "Insert",
			v = "Visual",
			V = "Visual Line",
			[""] = "Visual Block",
		}

		return mode_text[mode]
	end,
	color = function()
		local mode = vim.fn.mode()
		return { bg = mode_colors[mode], fg = colors.bg_3, bold = true }
	end,
}

M.filetype = {
	"filetype",
	colored = false,
	fmt = function(str)
		return string.upper(str:sub(1, 1)) .. str:sub(2, -1)
	end,
}

M.diff = {
	"diff",
	symbols = { added = icons.git.added, modified = icons.git.modified, removed = icons.git.removed },
	diff_color = {
		added = { fg = colors.green },
		modified = { fg = colors.orange },
		removed = { fg = colors.red },
	},
	cond = conditions.hide_in_width,
}

M.indent = {
	function()
		return vim.o.shiftwidth
	end,
	icon = "Space:",
}

M.separator_left = {
	function()
		return ""
	end,
	color = function()
		local mode = vim.fn.mode()
		return { bg = colors.bg_2, fg = mode_colors[mode] }
	end,
	padding = 0,
}

M.separator_right = {
	function()
		return ""
	end,
	color = function()
		local mode = vim.fn.mode()
		return { bg = colors.bg_2, fg = mode_colors[mode] }
	end,
	padding = 0,
}

return M
