return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "RRethy/nvim-treesitter-endwise", "Wansmer/treesj" },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "vimdoc", "ruby", "go" },
        auto_install = true,
        highlight = { enable = true },
        endwise = { enable = true }
      })

      require("treesj").setup()
      vim.keymap.set("n", "<leader>m", require("treesj").toggle, { desc = "toggle split treesitter object" })
    end
  }
}
