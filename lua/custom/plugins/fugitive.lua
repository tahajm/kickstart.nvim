return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<leader>gm', ':Gvdiffsplit! | GitConflictRefresh<CR>', { desc = 'Git merge 3-way split' })
    vim.keymap.set('n', '<leader>gq', ':diffoff! | only<CR>', { desc = 'Git close merge view' })
  end,
}
