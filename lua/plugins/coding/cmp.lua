local cmp = require("cmp")
local luasnip = require("luasnip")

local check_backspace = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))

	if col == 0 then
		return false
	end

	local current_line = vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
	local current_char = string.sub(current_line, col, col)

	return string.match(current_char, "%s") == nil
end

cmp.setup({
	preselect = cmp.PreselectMode.None,
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			vim_item.kind = require("core.icons").kinds[vim_item.kind]
			vim_item.menu = ({
				nvim_lsp = "Lsp",
				nvim_lua = "Lua",
				luasnip = "Snippet",
				buffer = "Buffer",
				path = "Path",
			})[entry.source.name]
			return vim_item
		end,
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.jumpable(1) then
				luasnip.jump(1)
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif luasnip.expandable() then
				luasnip.expand()
			elseif check_backspace() then
				fallback()
			else
				fallback()
			end
		end),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
	}),
	window = {
		completion = cmp.config.window.bordered(),
		documentation = {
			bordered = "rounded",
			max_width = 40,
			max_height = 20,
		},
	},
	experimental = {
		ghost_text = true,
	},
})

cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
