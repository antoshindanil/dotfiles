return {
  { "slim-template/vim-slim", },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
        no_italic = true,
      })

      vim.cmd(
        "colorscheme catppuccin")
    end
  }
}
