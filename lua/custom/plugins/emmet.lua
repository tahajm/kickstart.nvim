return {
  'mattn/emmet-vim',
  ft = { 'html', 'css', 'vue', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'htmldjango', 'sass', 'scss' },
  init = function()
    vim.g.user_emmet_install_global = 0
  end,
  config = function()
    local pattern = 'html,css,vue,javascript,javascriptreact,typescript,typescriptreact,htmldjango,sass,scss'

    local function setup_emmet(buf)
      vim.cmd 'EmmetInstall'
      -- <plug> mapping avoids the "not allowed to change text in expr" error
      vim.keymap.set('i', '<C-e>', '<plug>(emmet-expand-abbr)', {
        buffer = buf,
        remap = true,
        silent = true,
        desc = 'Emmet: expand abbreviation',
      })
    end

    -- For files opened after the plugin loads
    vim.api.nvim_create_autocmd('FileType', {
      pattern = pattern,
      callback = function(ev)
        setup_emmet(ev.buf)
      end,
    })

    -- For the current buffer (lazy re-fires FileType but just in case)
    local valid = {
      html = true, css = true, vue = true,
      javascript = true, javascriptreact = true,
      typescript = true, typescriptreact = true,
      htmldjango = true, sass = true, scss = true,
    }
    if valid[vim.bo.filetype] then
      setup_emmet(vim.api.nvim_get_current_buf())
    end
  end,
}
