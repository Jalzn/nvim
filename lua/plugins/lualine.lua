local lualine = require("lualine")

local colors = {
  red = "#fb4934",
  green = "#b8bb26",
  yellow = "#fabd2f",
  blue = "#83a598",
  purple = "#d3869b",
  aqua = "#8ec07c",
  orange = "#fe8019",
  gray = "#a89984",
  bg = "#3c3836",
  fg = "#ebdbb2",
}

local config = {
  options = {
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    globalstatus = true,
    theme = {
      normal = {
        a = { fg = colors.bg, bg = colors.green },
        b = { fg = colors.bg, bg = colors.gray },
        c = { fg = colors.gray, bg = colors.bg },

        x = { fg = colors.gray, bg = colors.bg },
        y = { fg = colors.bg, bg = colors.gray },
      },
      insert = {
        a = { fg = colors.bg, bg = colors.aqua },
      },
      visual = {
        a = { fg = colors.bg, bg = colors.yellow },
      },
      replace = {},
      inactive = {},
    },
  },
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  }
}

table.insert(config.sections.lualine_a, {
  function()
    return ''
  end,
  separator = { right = '' },
  padding = { left = 1, right = 1 }
})

table.insert(config.sections.lualine_b, {
  'branch',
  icon = '',
  separator = { right = '' },
})

table.insert(config.sections.lualine_c, {
  'filename',
})

table.insert(config.sections.lualine_c, {
  'diff',
  symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
})

table.insert(config.sections.lualine_x, {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
})

table.insert(config.sections.lualine_x, {
  function()
    local msg = 'Lsp inactive'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = ' ',
})

table.insert(config.sections.lualine_y, {
  function()
    local ft = vim.bo.filetype or ''
    return "{} " .. ft
  end
})

table.insert(config.sections.lualine_z, {
  "progress",
  fmt = function()
    return "%P/%L"
  end,
})

lualine.setup(config)
