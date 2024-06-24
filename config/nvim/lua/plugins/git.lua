return {
  {
    "lewis6991/gitsigns.nvim",
    opts = { current_line_blame = true },
  },
  {
    "tpope/vim-fugitive",
    dependencies = { "shumphrey/fugitive-gitlab.vim", "tpope/vim-rhubarb" },
    config = function()
      vim.keymap.set("n", "<Leader>gs", ":tab Git<CR>", {desc = 'Open Fugitive'})
      vim.g.fugitive_gitlab_domains = { "https://rscz.ru", "https://github.com" }
    end
  }
}
