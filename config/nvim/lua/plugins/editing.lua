return {
  -- {
  --   "gbprod/yanky.nvim",
  --   opts = {},
  -- },
  {
    "numToStr/Comment.nvim",
    opts = {},
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },
  {
    "chrisgrieser/nvim-various-textobjs",
    lazy = false,
    opts = { useDefaultKeymaps = true },
  },
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<Leader>u", vim.cmd.UndotreeToggle, { desc = "Open UndoTree" })
    end,
  },
}
