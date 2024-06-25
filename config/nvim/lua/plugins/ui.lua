return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = { indent = { char = "│" } },
  },
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    opts = {},
    dependencies = "nvim-tree/nvim-web-devicons",
  },
  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        hover = { enabled = false },
        signature = { enabled = false }
      }
    },
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" }
  },
  {
    "projekt0n/github-nvim-theme",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.opt.background = "light"
      vim.cmd("colorscheme github_light")
    end
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
}
