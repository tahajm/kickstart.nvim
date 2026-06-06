return {
  'akinsho/git-conflict.nvim',
  version = '*',
  config = function()
    require('git-conflict').setup {
      default_mappings = true,
    }

    vim.keymap.set('n', 'cl', '<cmd>GitConflictChooseOurs<CR>', { desc = 'Conflict choose left (ours)' })
    vim.keymap.set('n', 'cr', '<cmd>GitConflictChooseTheirs<CR>', { desc = 'Conflict choose right (theirs)' })
  end,
}
