return {
  'okuuva/auto-save.nvim',
  event = 'InsertLeave',
  opts = {
    enabled = true,
    debounce_delay = 1000,
    condition = function(buf)
      local path = vim.api.nvim_buf_get_name(buf)
      return vim.fn.finddir('.git', path .. ';') ~= ''
    end,
  },
}
