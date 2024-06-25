return {
  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      require("mini.bracketed").setup()

      require("mini.files").setup()
      local MiniFiles = require("mini.files")
      vim.keymap.set("n", "<Tab>",
        function() if not MiniFiles.close() then MiniFiles.open(vim.api.nvim_buf_get_name(0), true) end end, {})
    end
  }
}
