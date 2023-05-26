local lspsaga = require("lspsaga")

lspsaga.setup({
	ui = {
		title = true,
		-- Border type can be single, double, rounded, solid, shadow.
		border = "rounded",
		winblend = 0,
		expand = "",
		collapse = "",
		code_action = "💡",
		incoming = " ",
		outgoing = " ",
		hover = " ",
		kind = {},
	},
	outline = {
		win_position = "right",
		win_with = "",
		win_width = 30,
		show_detail = true,
		auto_preview = true,
		auto_refresh = true,
		auto_close = true,
		custom_sort = nil,
		keys = {
			jump = "o",
			expand_collapse = "u",
			quit = "q",
		},
	},
	symbol_in_winbar = {
		enable = false,
		separator = " ",
		hide_keyword = true,
		show_file = true,
		folder_level = 2,
		respect_root = false,
		color_mode = true,
	},
	code_action = {
		num_shortcut = true,
		show_server_name = true,
		keys = {
			-- string | table type
			quit = "q",
			exec = "<CR>",
		},
	},
	rename = {
		quit = "<ESC>",
		exec = "<CR>",
		mark = "x",
		confirm = "<CR>",
		in_select = true,
	},
})
