vim.diagnostic.config { virtual_text = false }

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Make nvm-managed node/npm visible to Mason and other tools
local nvm_default = vim.fn.expand '~/.nvm/alias/default'
local default_version = vim.fn.readfile(nvm_default)[1]
if default_version then
  local node_bin = vim.fn.expand('~/.nvm/versions/node/' .. default_version .. '/bin')
  if vim.fn.isdirectory(node_bin) == 1 then
    vim.env.PATH = node_bin .. ':' .. vim.env.PATH
  end
end
