return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter-context", "RRethy/nvim-treesitter-endwise" },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "vimdoc", "ruby", "go" },
        auto_install = true,
        highlight = { enable = true },
        endwise = { enable = true }
      })

      require "treesitter-context".setup()
    end
  }
}
