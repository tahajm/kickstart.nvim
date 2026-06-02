return {
  'marko-cerovac/material.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('material').setup {
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
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
      high_visibility = {
        darker = true,
      },
      lualine_style = 'default',
    }
    vim.g.material_style = 'darker'
    -- Switch to 'colorscheme material' to use material.nvim instead
    vim.cmd 'colorscheme material-darker-hc'
    vim.api.nvim_create_autocmd('VimEnter', {
      once = true,
      callback = function()
        vim.cmd 'colorscheme material-darker-hc'
      end,
    })
  end,
}
