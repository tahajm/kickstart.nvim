return {
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        'jdtls',
        'java-test',
        'java-debug-adapter',
      })
      return opts
    end,
  },

  {
    'mfussenegger/nvim-dap',
    lazy = true,
  },

  {
    'mfussenegger/nvim-jdtls',
    ft = 'java',
    dependencies = { 'mfussenegger/nvim-dap' },
    config = function()
      local function start_jdtls()
        local jdtls = require 'jdtls'
        local mason_path = vim.fn.stdpath 'data' .. '/mason/packages/jdtls'
        local launcher = vim.fn.glob(mason_path .. '/plugins/org.eclipse.equinox.launcher_*.jar')

        local os_config = 'config_linux'
        if vim.fn.has 'mac' == 1 then
          os_config = 'config_mac'
        elseif vim.fn.has 'win32' == 1 then
          os_config = 'config_win'
        end

        local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
        local workspace = vim.fn.stdpath 'cache' .. '/jdtls/' .. project_name

        -- Debug + test bundles
        local bundles = {}
        local debug_jar = vim.fn.glob(
          vim.fn.stdpath 'data' .. '/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar'
        )
        if debug_jar ~= '' then
          table.insert(bundles, debug_jar)
        end
        vim.list_extend(
          bundles,
          vim.fn.glob(vim.fn.stdpath 'data' .. '/mason/packages/java-test/extension/server/*.jar', true, true)
        )

        local config = {
          cmd = {
            'java',
            '-Declipse.application=org.eclipse.jdt.ls.core.id1',
            '-Dosgi.bundles.defaultStartLevel=4',
            '-Declipse.product=org.eclipse.jdt.ls.core.product',
            '-Dlog.protocol=true',
            '-Dlog.level=ALL',
            '-Xmx1g',
            '--add-modules=ALL-SYSTEM',
            '--add-opens',
            'java.base/java.util=ALL-UNNAMED',
            '--add-opens',
            'java.base/java.lang=ALL-UNNAMED',
            '-jar',
            launcher,
            '-configuration',
            mason_path .. '/' .. os_config,
            '-data',
            workspace,
          },
          -- Fallback to cwd for simple folders (CS61B labs have no build files)
          root_dir = jdtls.setup.find_root { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' }
            or vim.fn.getcwd(),
          settings = {
            java = {
              format = { enabled = true },
              saveActions = { organizeImports = true },
              completion = { favoriteStaticMembers = { 'org.junit.Assert.*', 'org.junit.jupiter.api.Assertions.*' } },
            },
          },
          init_options = { bundles = bundles },
          capabilities = require('blink.cmp').get_lsp_capabilities(),
          on_attach = function(_, bufnr)
            -- Java-specific keymaps
            local map = function(keys, func, desc)
              vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'Java: ' .. desc })
            end
            map('<leader>co', jdtls.organize_imports, 'Organize imports')
            map('<leader>cv', jdtls.extract_variable, 'Extract variable')
            map('<leader>cm', jdtls.extract_method, 'Extract method')
            map('<leader>ct', jdtls.test_nearest_method, 'Test nearest method')
            map('<leader>cT', jdtls.test_class, 'Test class')
            map('<leader>cr', function()
              local file = vim.fn.expand '%:p'
              local class = vim.fn.expand '%:t:r'
              local dir = vim.fn.expand '%:p:h'
              local cmd = 'cd ' .. dir .. ' && javac ' .. file .. ' && java ' .. class
              require('toggleterm.terminal').Terminal:new({ cmd = cmd, direction = 'horizontal', close_on_exit = false }):toggle()
            end, 'Run file')

            if #bundles > 0 then
              jdtls.setup_dap { hotcodereplace = 'auto' }
            end
          end,
        }

        jdtls.start_or_attach(config)
      end

      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'java',
        callback = start_jdtls,
      })

      -- Trigger for buffer already open when plugin loads
      if vim.bo.filetype == 'java' then
        start_jdtls()
      end
    end,
  },
}
