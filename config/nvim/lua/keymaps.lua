vim.keymap.set('n', '<Esc>', ':noh<Return><Esc>', { desc = 'Hide highlights by Esc' })
vim.keymap.set('n', '<C-t>', ':!topen-bash<Return><Esc>', { desc = 'Open new tmux page by C-t' })
vim.keymap.set('n', '<A-q>', ':bd<CR>', { desc = 'Close buffer by A-q' })

vim.keymap.set('n', '<C-s>', "<cmd>w<cr><esc>", { desc = 'Save buffer by C-s' })

vim.keymap.set('n', '<C-H>', '<C-w>h', { desc = 'Focus on left window' })
vim.keymap.set('n', '<C-J>', '<C-w>j', { desc = 'Focus on below window' })
vim.keymap.set('n', '<C-K>', '<C-w>k', { desc = 'Focus on above window' })
vim.keymap.set('n', '<C-L>', '<C-w>l', { desc = 'Focus on right window' })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = 'Center view after paging' })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = 'Center view after paging' })

vim.keymap.set("i", "<C-c>", "<Esc>", { desc = 'Escape from insert mode' })

vim.keymap.set("n", "<leader>e", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = 'Change word by cursor over all buffer' })

vim.keymap.set({ 'n', 'x' }, 'gy', '"+y', { desc = 'Copy to system clipboard' })
vim.keymap.set('n', 'gp', '"+p', { desc = 'Paste from system clipboard' })
vim.keymap.set('x', 'gp', '"+P', { desc = 'Paste from system clipboard' })

