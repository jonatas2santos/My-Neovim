-- Diagnostic visual
vim.diagnostic.config({
  virtual_text = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.HINT] = '',
      [vim.diagnostic.severity.INFO] = '',
    },
  },
})

-- Auto attach Colorizer for supported filetypes
local colorizer_group = vim.api.nvim_create_augroup('colorizer_attach', { clear = true })
vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  group = colorizer_group,
  callback = function()
    vim.cmd('ColorizerAttachToBuffer')
  end,
})
