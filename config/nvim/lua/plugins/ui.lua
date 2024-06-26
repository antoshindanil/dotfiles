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
    "folke/noice.nvim",
    opts = {
      lsp = {
        hover = { enabled = false },
        signature = { enabled = false }
      }
    },
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim" }
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
    "f-person/auto-dark-mode.nvim",
    opts = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.opt.background = "dark"
        vim.cmd("colorscheme github_dark_default")
      end,
      set_light_mode = function()
        vim.opt.background = "light"
        vim.cmd("colorscheme github_light")
      end,
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {}
  },
}
