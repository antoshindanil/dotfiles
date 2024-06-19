return {
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set('n', '<C-g>', ':tab Git<CR>')
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
