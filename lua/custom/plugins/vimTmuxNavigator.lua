return {
  'christoomey/vim-tmux-navigator',
  lazy = false, -- Load immediately to ensure it works everywhere including terminals
  config = function()
    -- Disable default mappings, we'll set them up ourselves
    vim.g.tmux_navigator_no_mappings = 1

    -- Set up keymaps for both normal and terminal mode
    local modes = { 'n', 't' }
    vim.keymap.set(modes, '<C-h>', '<cmd>TmuxNavigateLeft<cr>', { desc = 'Navigate Left', silent = true })
    vim.keymap.set(modes, '<C-j>', '<cmd>TmuxNavigateDown<cr>', { desc = 'Navigate Down', silent = true })
    vim.keymap.set(modes, '<C-k>', '<cmd>TmuxNavigateUp<cr>', { desc = 'Navigate Up', silent = true })
    vim.keymap.set(modes, '<C-l>', '<cmd>TmuxNavigateRight<cr>', { desc = 'Navigate Right', silent = true })
    vim.keymap.set(modes, '<C-\\>', '<cmd>TmuxNavigatePrevious<cr>', { desc = 'Navigate Previous', silent = true })
  end,
}
