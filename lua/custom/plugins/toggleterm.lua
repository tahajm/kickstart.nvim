return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    -----------------------------------------------------------
    -- 🧭 Helper: get project root
    -----------------------------------------------------------
    local function project_root()
      local cwd = vim.fn.getcwd()
      local root = vim.fn.systemlist('git rev-parse --show-toplevel')[1]
      if vim.v.shell_error == 0 and root ~= '' then
        return root
      else
        return cwd
      end
    end

    -----------------------------------------------------------
    -- ⚙️ ToggleTerm setup
    -----------------------------------------------------------
    require('toggleterm').setup {
      size = function(term)
        if term.direction == 'horizontal' then
          return 15
        elseif term.direction == 'vertical' then
          return math.floor(vim.o.columns * 0.4)
        end
      end,
      start_in_insert = true,
      persist_size = true,
      close_on_exit = true,
      direction = 'float',
      float_opts = {
        border = 'rounded',
        width = math.floor(vim.o.columns * 0.8),
        height = math.floor(vim.o.lines * 0.8),
      },
      shell = vim.o.shell,
    }

    -----------------------------------------------------------
    -- 🪄 Terminal keymaps (navigation inside terminal)
    -----------------------------------------------------------
    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      -- Exit terminal mode
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
      -- Window command prefix
      vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
      -- NOTE: <C-h>, <C-j>, <C-k>, <C-l> navigation is handled by vim-tmux-navigator
    end
    vim.cmd 'autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()'

    -----------------------------------------------------------
    -- 🔢 ToggleTerm keymaps
    -----------------------------------------------------------

    -- 1️⃣ Float terminal
    vim.keymap.set('n', '<leader>tt', function()
      require('toggleterm').toggle(1, nil, project_root(), 'float')
    end, { desc = 'Toggle Float Terminal' })

    -- 2️⃣ Horizontal terminals (bottom)
    vim.keymap.set('n', '<leader>th', function()
      require('toggleterm').toggle(2, 15, project_root(), 'horizontal')
    end, { desc = 'Toggle Horizontal Terminal' })

    vim.keymap.set('n', '<leader>t\\', function()
      require('toggleterm').toggle(5, 15, project_root(), 'horizontal')
    end, { desc = 'Toggle Second Horizontal Terminal' })

    -- 3️⃣ Vertical terminals (right)
    vim.keymap.set('n', '<leader>tv', function()
      require('toggleterm').toggle(3, nil, project_root(), 'vertical')
    end, { desc = 'Toggle Vertical Terminal' })

    vim.keymap.set('n', '<leader>t-', function()
      require('toggleterm').toggle(4, nil, project_root(), 'vertical')
    end, { desc = 'Toggle Second Vertical Terminal' })

    -----------------------------------------------------------
    -- 🤖 Dedicated AI terminal with cursor-agent
    -----------------------------------------------------------
    local Terminal = require('toggleterm.terminal').Terminal
    local cursor_ai = Terminal:new {
      cmd = 'cursor-agent',
      dir = project_root(),
      direction = 'vertical',
      size = math.floor(vim.o.columns * 0.4),
      hidden = true,
      on_open = function(term)
        vim.cmd 'startinsert!'
        vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
      end,
      on_close = function()
        vim.cmd 'stopinsert'
      end,
    }

    function _G._cursor_ai_toggle()
      cursor_ai:toggle()
    end
    vim.keymap.set('n', '<leader>ta', '<cmd>lua _cursor_ai_toggle()<CR>', { desc = 'Toggle Cursor AI Terminal' })
  end,
}
