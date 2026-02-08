return {
  'marko-cerovac/material.nvim',
  priority = 1000, -- Load before other plugins
  config = function()
    -- Configure material theme
    require('material').setup {
      contrast = {
        terminal = false, -- Enable contrast for the built-in terminal
        sidebars = false, -- Enable contrast for sidebar-like windows
        floating_windows = false, -- Enable contrast for floating windows
        cursor_line = false, -- Enable darker background for the cursor line
        lsp_virtual_text = false, -- Enable contrasted background for lsp virtual text
        non_current_windows = false, -- Enable contrasted background for non-current windows
        filetypes = {}, -- Specify which filetypes get the contrasted background
      },
      styles = {
        comments = { italic = false },
        strings = {},
        keywords = {},
        functions = {},
        variables = {},
      },
      plugins = {
        'gitsigns',
        'nvim-cmp',
        'nvim-web-devicons',
        'telescope',
        'which-key',
      },
      disable = {
        colored_cursor = false, -- Disable the colored cursor
        borders = false, -- Disable borders between vertically split windows
        background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
        term_colors = false, -- Prevent the theme from setting terminal colors
        eob_lines = false, -- Hide the end-of-buffer lines
      },
      high_visibility = {
        lighter = false, -- Enable higher contrast text for lighter style
        darker = false, -- Enable higher contrast text for darker style
      },
      lualine_style = 'default', -- Lualine style ( can be 'stealth' or 'default' )
      async_loading = true, -- Load parts of the theme asynchronously for faster startup
    }

    -- Set the material style to 'darker'
    vim.g.material_style = 'darker'

    -- Apply the colorscheme
    vim.cmd 'colorscheme material'
  end,
}
