local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr, preserve_mappings = false })
  lsp_zero.buffer_autoformat()
end)

require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {},
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,

    html = function()
      local html_opts = {
        filetypes = { "html", "htmldjango" }
      }
      require('lspconfig').html.setup(html_opts)
    end
  }
})
