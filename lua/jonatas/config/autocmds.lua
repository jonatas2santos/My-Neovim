-- ==============
-- AUTOCOMMANDS
-- ==============

-- Copy current file path to clipboard
vim.keymap.set('n', '<LEADER>fp', function()
  local file_path = vim.fn.expand( '%:~' )
  vim.fn.setreg( '+', file_path )
  print( 'File path copied to clipboard: ' .. file_path )
end, { desc = 'copy file path to clipboard' })

-- Highlight text on yank
local yank_group = vim.api.nvim_create_augroup( 'highlight_yank', { clear = true })
vim.api.nvim_create_autocmd( 'TextYankPost', {
  group = yank_group,
  desc = 'highlight text when yanking',
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Open help files in a vertical split on the right
vim.api.nvim_create_autocmd( 'FileType', {
  pattern = 'help',
  callback = function ()
    vim.cmd.wincmd('L')
  end,
})

-- Close the help buffers with 'q'
vim.api.nvim_create_autocmd( 'FileType', {
  pattern = 'help',
  callback = function()
    vim.keymap.set('n', 'q', '<CMD>quit<CR>', { buffer = true, silent = true })
  end,
})

-- Auto-resize splits when the window size changes
vim.api.nvim_create_autocmd( 'VimResized', {
  callback = function ()
    vim.cmd.wincmd('=')
  end,
})

-- Disable automatic comment continuation
local no_comment_group = vim.api.nvim_create_augroup( 'no_auto_comment', { clear = true })
vim.api.nvim_create_autocmd( 'FileType', {
  group = no_comment_group,
  callback = function()
    vim.opt_local.formatoptions:remove({ 'c', 'r', 'o' })
  end,
})

-- Show cursorline only in the active window
local cursorline_group = vim.api.nvim_create_augroup( 'active_cursorline', { clear = true })
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

-- Sync working directory with Oil
vim.api.nvim_create_autocmd( 'BufEnter', {
  callback = function ()
    if vim.bo.filetype ~= 'oil' then
      return
    end
    local dir = require('oil').get_current_dir()
    if dir then
      vim.cmd.lcd(dir)
    end
  end,
})

-- Auto-create missing directories on save
vim.api.nvim_create_autocmd( 'BufWritePre', {
  callback = function()
    local file = vim.api.nvim_buf_get_name(0)
    -- Ignore virtual buffers ( oil, term, etc )
    if file == '' or file:match('^%w+://') then
      return
    end
    local dir = vim.fn.fnamemodify(file, ':p:h')
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, 'p')
    end
  end,
})

-- Unlink LuaSnip snippet when leaving insert mode
vim.api.nvim_create_autocmd( 'InsertLeave', {
  callback = function()
    local ok, ls = pcall(require, 'luasnip')
    if not ok then
      return
    end

    local buf = vim.api.nvim_get_current_buf()
    if ls.session.current_nodes[buf] then
      ls.unlink_current()
    end
  end,
})

-- ============================================
-- CELL HIGHLIGHT ( Jupyter-style # %% cells )
-- ============================================

local cell_ns = vim.api.nvim_create_namespace( 'cell_highlight' )

-- Highlight groups
vim.api.nvim_set_hl(0, 'CellHeaderHighlight', {
  bg = '#e7c019',
  bold = true,
})

vim.api.nvim_set_hl(0, 'CellBodyHighlight', {
  bg = '#1f2329',
})

vim.api.nvim_set_hl(0, 'CellSeparator', {
  fg = '#e7c019',
})

vim.api.nvim_set_hl(0, 'CellIcon', {
  fg = '#82aaff',
  bold = true,
})

local function highlight_current_cell()
  local buf = vim.api.nvim_get_current_buf()
  local cursor = vim.api.nvim_win_get_cursor(0)[1]
  local lines = vim.api.nvim_buf_get_lines( buf, 0, -1, false )

  vim.api.nvim_buf_clear_namespace( buf, cell_ns, 0, -1 )

  -- Collect all cell headers
  local cells = {}
  for i, line in ipairs(lines) do
    if line:match( '^# %%%%' ) then
      table.insert(cells, i)
    end
  end

  if #cells == 0 then
    return
  end

  local start_line, end_line

  for i = 1, #cells do
    local cur = cells[i]
    local nxt = cells[i + 1]

    if cursor >= cur and ( not nxt or cursor < nxt ) then
      start_line = cur
      end_line = ( nxt and nxt - 1 ) or #lines
      break
    end
  end

  if not start_line then
    return
  end

  -- Highlight header
  vim.api.nvim_buf_add_highlight( buf, cell_ns, 'CellHeaderHighlight', start_line - 1, 0, -1 )

  -- Header icon
  vim.api.nvim_buf_set_extmark( buf, cell_ns, start_line - 1, 0, {
    virt_text = { { '󰐍 ', 'CellIcon' } },
    virt_text_pos = 'overlay',
  })

  -- Highlight cell body
  for l = start_line + 1, end_line do
    vim.api.nvim_buf_add_highlight( buf, cell_ns, 'CellBodyHighlight', l - 1, 0, -1 )
  end

  -- Bottom separator
  vim.api.nvim_buf_set_extmark( buf, cell_ns, end_line - 1, 0, {
    virt_text = { { '─' .. string.rep('─', 50), 'CellSeparator' } },
    virt_text_pos = 'eol',
  })
end

vim.api.nvim_create_autocmd({ 'CursorMoved', 'BufEnter' }, {
  callback = highlight_current_cell,
})
