return {
  { "folke/lazy.nvim",  tag = "stable" },
  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        overrides = {
          SignColumn = { bg = '#282828' },
          IblIndent = { fg = "#303030" },
          ColorColumn = { bg = "#303030" },
        }
      })

      vim.cmd.colorscheme("gruvbox")
    end
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
    },
    config = function()
      require("plugins.lsp")
    end
  },
  {
    "https://github.com/nvimtools/none-ls.nvim",
    config = function()
      require("plugins.null-ls")
    end
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      { "onsails/lspkind.nvim" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
      { "hrsh7th/cmp-nvim-lua" },
      { "saadparwaiz1/cmp_luasnip" },
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },
    },
    config = function()
      require("plugins.cmp")
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("plugins.lualine")
    end
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end
  },
  {
    "echasnovski/mini.surround",
    config = function()
      require("mini.surround").setup()
    end
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl").setup({ scope = { enabled = false } })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = function()
      return require("plugins.treesitter")
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup()
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon"):setup()
    end
  },
  { "folke/neodev.nvim" },
}
