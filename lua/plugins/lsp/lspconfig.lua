local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

local available = mason_lspconfig.get_available_servers()

local ensure_installed = {}

local servers = {
	lua_ls = {
		settings = {
			Lua = {
				hint = { enable = true },
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
					},
				},
			},
		},
	},
	tsserver = {
		settings = {
			typescript = {
				inlayHints = {
					includeInlayParameterNameHints = "all",
					includeInlayParameterNameHintsWhenArgumentMatchesName = false,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayVariableTypeHints = true,
					includeInlayVariableTypeHintsWhenTypeMatchesName = false,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayEnumMemberValueHints = true,
				},
			},
		},
	},
	pyright = {},
}

local function setup(server)
	local opts = vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
		on_attach = function(client, bufnr)
			require("lsp-inlayhints").on_attach(client, bufnr)
		end,
	}, servers[server] or {})

	lspconfig[server].setup(opts)
end

for server, _ in pairs(servers) do
	if not vim.tbl_contains(available, server) then
		setup(server)
	else
		ensure_installed[#ensure_installed + 1] = server
	end
end

mason.setup()
mason_lspconfig.setup({ ensure_installed = ensure_installed })
mason_lspconfig.setup_handlers({ setup })
