return {
  {
    "lewis6991/gitsigns.nvim",
    opts = { current_line_blame = true },
  },
  {
    "tpope/vim-fugitive",
    dependencies = { "shumphrey/fugitive-gitlab.vim", "tpope/vim-rhubarb" },
    config = function()
      vim.keymap.set("n", "<Leader>gs", ":Git<CR>", { desc = 'Open Fugitive' })
      vim.keymap.set("n", "<Leader>gl", ":Git log %<CR>", { desc = 'Open Git log' })
      vim.keymap.set("n", "<Leader>gL", ":Git log<CR>", { desc = 'Open Git log' })
      vim.keymap.set("n", "<Leader>gb", ":Git blame<CR>", { desc = 'Open Git blame' })
      vim.keymap.set("n", "<Leader>gB", ":GBrowse<CR>", { desc = 'Open Git browse' })
      vim.keymap.set("n", "<Leader>gd", ":Git diff<CR>", { desc = 'Open Git diff' })
      vim.g.fugitive_gitlab_domains = { "https://rscz.ru" }
    end
  }
}
