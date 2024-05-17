return {
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require('mini.notify').setup()
      require('mini.ai').setup()
      require('mini.align').setup()
      require('mini.bracketed').setup()
      require('mini.comment').setup()
      require('mini.jump').setup()
      require('mini.move').setup()
      require('mini.pairs').setup()
      require('mini.surround').setup()
      require('mini.splitjoin').setup()
      require('mini.diff').setup()
      require('mini.statusline').setup()

      require('mini.trailspace').setup()
      local MiniTrailspace = require('mini.trailspace')
      vim.keymap.set('n', '<Leader>ds', function() MiniTrailspace.trim() end, {})
    end
  }
}
