-- Custom LSP configuration for Vue + TypeScript support
-- This extends the base nvim-lspconfig setup from init.lua
return {
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = function(_, opts)
      -- Extend the ensure_installed list with Vue and TypeScript servers
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        'vue-language-server',
        'typescript-language-server',
      })
      return opts
    end,
  },
  {
    'neovim/nvim-lspconfig',
    optional = true,
    opts = function()
      -- This runs after lspconfig loads
      -- Set up ts_ls with Vue TypeScript plugin support
      vim.schedule(function()
        local capabilities = require('blink.cmp').get_lsp_capabilities()

        -- Configure ts_ls with Vue TypeScript plugin using new vim.lsp.config API (Neovim 0.11+)
        vim.lsp.config('ts_ls', {
          capabilities = capabilities,
          cmd = { 'typescript-language-server', '--stdio' },
          root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
          init_options = {
            plugins = {
              {
                name = '@vue/typescript-plugin',
                location = vim.fn.stdpath 'data' .. '/mason/packages/vue-language-server/node_modules/@vue/typescript-plugin',
                languages = { 'vue' },
              },
            },
          },
          filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
        })

        vim.lsp.enable 'ts_ls'

        -- Configure vue_ls
        vim.lsp.config('vue_ls', {
          capabilities = capabilities,
          cmd = { 'vue-language-server', '--stdio' },
          root_markers = { 'package.json' },
          filetypes = { 'vue' },
        })

        vim.lsp.enable 'vue_ls'
      end)
    end,
  },
}
