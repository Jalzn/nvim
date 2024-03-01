require("oil").setup({
  keymaps = {
    ["<ESC>"] = "actions.close"
  },
  float = {
    -- Padding around the floating window
    padding = 2,
    max_width = 48,
    max_height = 24,
    border = "rounded",
    win_options = {
      winblend = 0,
    },
    -- This is the config that will be passed to nvim_open_win.
    -- Change values here to customize the layout
    override = function(conf)
      return conf
    end,
  },
})
