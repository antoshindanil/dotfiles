return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-project.nvim',
    'sato-s/telescope-rails.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    'OliverChao/telescope-picker-list.nvim'
  },
  config = function()
    local builtin = require('telescope.builtin')
    local ext = require('telescope').extensions

    local project_actions = require('telescope._extensions.project.actions')
    require 'telescope'.setup {
      defaults = {
        layout_config = {
          horizontal = { width = 0.95 }
        },
      },
      pickers = {
        colorscheme = {
          enable_preview = true
        }
      },
      extensions = {
        project = {
          base_dirs = {
            '~/w',
            '~/dotfiles'
          },
          hidden_files = true, -- default: false
          theme = 'dropdown',
          order_by = 'asc',
          search_by = 'title',
          on_project_selected = function(prompt_bufnr)
            project_actions.change_working_directory(prompt_bufnr, false)
          end
        }
      },
    }

    require('telescope').load_extension('project')
    require("telescope").load_extension("rails")
    require("telescope").load_extension("picker_list")
    require("telescope").load_extension("ui-select")

    vim.keymap.set('n', '<Leader><Leader>', builtin.find_files,            {})
    vim.keymap.set('n', '<Leader>fc',       builtin.commands,              {})
    vim.keymap.set('n', '<Leader>fs',       builtin.live_grep,             {})
    vim.keymap.set('x', '<Leader>fs',       builtin.grep_string,           {})
    vim.keymap.set('n', '<Leader>fds',      builtin.lsp_document_symbols,  {})
    vim.keymap.set('n', '<Leader>fws',      builtin.lsp_workspace_symbols, {})
    vim.keymap.set('n', '<Leader>fg',       builtin.git_commits,           {})
    vim.keymap.set('n', '<Leader>fgb',      builtin.git_bcommits,          {})
    vim.keymap.set('x', '<Leader>fgb',      builtin.git_bcommits_range,    {})
    vim.keymap.set('n', '<Leader>b',        builtin.buffers,               {})
    vim.keymap.set('n', '<Leader>fq',       builtin.quickfix,              {})
    vim.keymap.set('n', '<Leader>fp',       ext.project.project,           {})
    vim.keymap.set('n', '<Leader>frm',      ext.rails.models,              {})
    vim.keymap.set('n', '<Leader>frc',      ext.rails.controllers,         {})
    vim.keymap.set('n', '<Leader>frv',      ext.rails.views,               {})
    vim.keymap.set('n', '<Leader>frs',      ext.rails.specs,               {})
  end
}
