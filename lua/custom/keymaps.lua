-- open file explorer !! it is not working while oil is there
vim.keymap.set('n', '<leader>e', ':Explore<CR>', { desc = 'Open netrw explorer' })

-- Oil: - open parent directory
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

-- ToggleTerm: open terminal in float mode
vim.keymap.set('n', '<leader>tt', function()
  require('toggleterm').toggle(1, 15, 'Terminal', 'float')
end, { desc = 'Toggle Terminal' })

-- Rust: <leader>rr
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'rust',
  callback = function()
    vim.keymap.set('n', '<leader>rr', ':!rustc % && ./$(basename % .rs)<CR>', { buffer = true, desc = 'Run Rust file' })
  end,
})

-- JavaScript: <leader>rr
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'javascript',
  callback = function()
    vim.keymap.set('n', '<leader>rr', ':!node %<CR>', { buffer = true, desc = 'Run JavaScript file' })
  end,
})

-- TypeScript: <leader>rr
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'typescript',
  callback = function()
    vim.keymap.set('n', '<leader>rr', ':!ts-node %<CR>', { buffer = true, desc = 'Run TypeScript file' })
  end,
})
