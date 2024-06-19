return {
  {
    "tpope/vim-fugitive",
    dependencies = {
      "shumphrey/fugitive-gitlab.vim",
      "tpope/vim-rhubarb"
    },
    config = function()
      vim.keymap.set('n', '<C-g>', ':tab Git<CR>')
      vim.g.fugitive_gitlab_domains = { "https://rscz.ru", "https://github.com" }
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({
        current_line_blame = true
      })
    end,
  }
}
