-- AUTOCMDS

-- Copy current file path to clipboard
vim.keymap.set('n', '<LEADER>fp', function()
  local filePath = vim.fn.expand('%:~')
  vim.fn.setreg('+', filePath)
  print('file path copied to clipboard: ' .. filePath)
end, { desc = 'copy file path to clipboard' })

-- highlight text on yank
local yank_group = vim.api.nvim_create_augroup('highlight_yank', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  group = yank_group,
  desc = 'highlight when yanking text',
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Open help files in a vertical split on the right
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'help',
  command = 'wincmd L',
})

-- Auto-resize splits when the window size changes
vim.api.nvim_create_autocmd('VimResized', {
  command = 'wincmd =',
})

-- Disable automatic comment continuation
local no_comment_group = vim.api.nvim_create_augroup('no_auto_comment', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = no_comment_group,
  callback = function()
    vim.opt_local.formatoptions:remove({ 'c', 'r', 'o' })
  end,
})

-- Show cursorline only in the active window
local cursorline_group = vim.api.nvim_create_augroup('active_cursorline', { clear = true })

vim.api.nvim_create_autocmd({ 'WinEnter', 'BufEnter' }, {
  group = cursorline_group,
  callback = function()
    vim.opt_local.cursorline = true
  end,
})

vim.api.nvim_create_autocmd({ 'WinLeave', 'BufLeave' }, {
  group = cursorline_group,
  callback = function()
    vim.opt_local.cursorline = false
  end,
})
