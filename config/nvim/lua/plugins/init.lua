return {
  { "slim-template/vim-slim", },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  {
  'projekt0n/github-nvim-theme',
  lazy = false,
  priority = 1000,
  config = function()
    require('github-theme').setup()
    vim.cmd('colorscheme github_light')
  end,
}
}
