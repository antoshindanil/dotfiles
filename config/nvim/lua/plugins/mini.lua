return {
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require('mini.notify').setup()
      require('mini.align').setup()
      require('mini.ai').setup()
      require('mini.bracketed').setup()
      require('mini.comment').setup()
      require('mini.jump').setup()
      require('mini.move').setup()
      require('mini.pairs').setup()
      require('mini.surround').setup()
      require('mini.splitjoin').setup()
      require('mini.statusline').setup()
      require('mini.extra').setup()
      require('mini.pick').setup()

      require('mini.diff').setup({
        view = {
          style = 'sign',
          signs = { add = '▒', change = '▒', delete = '▒' },
          priority = 199,
        },
      })

      require('mini.indentscope').setup({
        draw = {
          delay = 0,
        },
        symbol = "│"
      })

      require('mini.basics').setup({
        options = {
          basic = true,
          extra_ui = true,
          win_borders = 'default',
        },
        mappings = {
          basic = true,
          windows = true,
          move_with_alt = false,
        },
        autocommands = {
          basic = true,
          relnum_in_visual_mode = false,
        },
        silent = false,
      })

      require('mini.visits').setup()
      local MiniVisits = require('mini.visits')
      vim.keymap.set('n', '<C-e>', function() MiniVisits.select_path() end, {})

      require('mini.trailspace').setup()
      local MiniTrailspace = require('mini.trailspace')
      vim.keymap.set('n', '<Leader>ds', function() MiniTrailspace.trim() end, {})

      require('mini.files').setup()
      local MiniFiles = require('mini.files')
      vim.keymap.set('n', '<Tab>',
        function() if not MiniFiles.close() then MiniFiles.open(vim.api.nvim_buf_get_name(0), true) end end, {})
    end
  }
}
