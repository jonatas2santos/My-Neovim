-- ======================
-- Small UI / diagnostics
-- ======================

-- Diagnostic visuals
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
vim.api.nvim_create_autocmd({ 'FileType' }, {
  group = colorizer_group,
  pattern = {
    'css',
    'scss',
    'html',
    'lua',
    'python',
    'markdown',
    'quarto',
  },
  callback = function()
    if vim.fn.exists(':ColorizerAttachToBuffer') == 2 then
      vim.cmd('ColorizerAttachToBuffer')
    end
  end,
})
