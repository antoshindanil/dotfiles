return {
  { "slim-template/vim-slim", },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  {
    'projekt0n/github-nvim-theme',
    lazy = false,
    priority = 1000,
    config = function()
      require('github-theme').setup()
      vim.cmd('colorscheme github_light')
    end,
  },
  {
    "cshuaimin/ssr.nvim",
    module = "ssr",
    -- Calling setup is optional.
    config = function()
      require("ssr").setup()

      vim.keymap.set({ "n", "x" }, "<leader>ssr", function() require("ssr").open() end)
    end
  }
}
