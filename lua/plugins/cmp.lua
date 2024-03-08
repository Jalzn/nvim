local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()
local luasnip = require("luasnip")

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	formatting = {
		fields = { "abbr", "kind", "menu" },
		format = require("lspkind").cmp_format({
			maxwidth = 50,
			ellipsis_char = "...",
			mode = "symbol_text",
		}),
	},
	mapping = {
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<C-k>"] = cmp.mapping.scroll_docs(-4),
		["<C-j>"] = cmp.mapping.scroll_docs(4),
		["<C-c>"] = cmp.mapping.abort(),
		["<C-f>"] = cmp_action.luasnip_jump_forward(),
		["<C-b>"] = cmp_action.luasnip_jump_backward(),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "luasnip" },
		{
			name = "path",
			option = { trailing_slash = true }
		},
	},
})
