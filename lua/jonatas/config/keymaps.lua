-- ============================================
-- KEYMAPS - Core of the Neovim setup
-- Organized by domain and semantic prefixes
-- ============================================

-- Local helpers
local vks = vim.keymap.set
local opts = { noremap = true, silent = true }

--------------------------------------
-- INSERT MODE - Cursor movement
--------------------------------------
vks('i', '<C-h>', '<C-o>h')
vks('i', '<C-j>', '<C-o>j')
vks('i', '<C-k>', '<C-o>k')
vks('i', '<C-l>', '<C-o>l')

-- Quick escape
vks('i', 'jk', '<ESC>')

------------------------------------------------
-- NORMAL / VISUAL MODE - Line & text movement
------------------------------------------------
-- Move selected lines while keeping selection and indentation
vks("v", "J", ":m '>+1<CR>gv=gv", { desc = "move selection down" })
vks("v", "K", ":m '<-2<CR>gv=gv", { desc = "move selection up" })

-- Join lines without moving cursor
vks('n', 'J', 'mzJ`z')

-----------------------------------------------------
-- NORMAL MODE - Navigation with cursor centering
-----------------------------------------------------
vks('n', '<C-d>', '<C-d>zz', { desc = 'half-page down (centered)' })
vks('n', '<C-u>', '<C-u>zz', { desc = 'half-page up (centered)' })
vks('n', 'n', 'nzzz')
vks('n', 'N', 'Nzzz')

------------------------------
-- VISUAL MODE - Indentation
------------------------------
vks('v', 'H', '<gv', opts)
vks('v', 'L', '>gv', opts)

---------------------
-- TEXT OPERATIONS
---------------------
-- Delete without yanking
vks({ 'n', 'v' }, '<LEADER>d', [["_d]], { desc = 'delete without yanking' })

-- Delete single character without yanking
vks("n", "x", '"_x', opts)

-- Replace word under cursor globally
vks('n', '<LEADER>rw', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<LEFT><LEFT><LEFT>]],
  { desc = 'replace word under cursor (global)' })

-- Clear search highlights
vks('n', '<LEADER>h', '<CMD>nohl<CR>', { desc = 'clear search hl', silent = true })

---------------------------
-- FILE & BUFFER ACTIONS
---------------------------
-- Make file executable
vks('n', '<LEADER>xc', '<CMD>!chmod u+x %<CR>', { desc = 'make file executable', silent = true })

-- Select all
vks('n', '<C-a>', 'GVgg')

---------------------------------
-- TAB MANAGEMENT ( <LEADER>a* )
---------------------------------
vks('n', '<LEADER>ao', '<CMD>tabnew<CR>', { desc = 'new tab' })
vks('n', '<LEADER>ax', '<CMD>tabclose<CR>', { desc = 'close tab' })
vks('n', '<LEADER>an', '<CMD>tabn<CR>', { desc = 'next tab' })
vks('n', '<LEADER>ap', '<CMD>tabp<CR>', { desc = 'prev tab' })
vks('n', '<LEADER>ac', '<CMD>tabnew %<CR>', { desc = 'open current file in new tab' })

-- move tabs with wrap-around behavior
local function tabmove_wrap(dir)
  local cur = vim.fn.tabpagenr()
  local last = vim.fn.tabpagenr('$')

  if dir == 'next' then
    if cur == last then
      vim.cmd('tabmove 0')
    else
      vim.cmd('tabmove +1')
    end
  else
    if cur == 1 then
      vim.cmd('tabmove $')
    else
      vim.cmd('tabmove -1')
    end
  end
end

vks('n', '<LEADER>ad', function()
  tabmove_wrap('next')
end, { desc = 'Move tab right (wrap)' })
vks('n', '<LEADER>as', function()
  tabmove_wrap('prev')
end, { desc = 'Move tab left (wrap)' })


vks('n', '<LEADER>cd', function()
  vim.cmd('cd %:p:h')
  print('CWD:', vim.fn.getcwd())
end, { desc = 'cd para diretório do buffer atual' })

-----------------------------------------------
-- WINDOW / SPLIT MANAGEMENT ( <LEADER>s* )
-----------------------------------------------
vks('n', '<LEADER>sv', '<C-w>v', { desc = 'vertical split' })
vks('n', '<LEADER>sh', '<C-w>s', { desc = 'horizontal split' })
vks('n', '<LEADER>se', '<C-w>=', { desc = 'equalize splits' })

-- Window navigation ( Normal + Insert )
vks({ 'n', 'i' }, '<A-H>', '<C-w>h')
vks({ 'n', 'i' }, '<A-J>', '<C-w>j')
vks({ 'n', 'i' }, '<A-K>', '<C-w>k')
vks({ 'n', 'i' }, '<A-L>', '<C-w>l')

-----------------------------------------------
-- LINE CREATION ( quick edit helpers )
-----------------------------------------------
vks('n', 'op', 'o<ESC>k', { desc = 'insert line below (stay)' })
vks('n', 'oi', 'O<ESC>j', { desc = 'insert line above (stay)' })
vks('n', 'ok', 'o<ESC>kO<ESC>j', { desc = 'insert line above & below' })
vks('n', 'oo', 'A<CR>', { desc = 'append new line' })

-----------------------------------------------
-- EXIT / SESSION SHORTCUTS ( <LEADER>t* )
-----------------------------------------------
vks('n', '<LEADER>tt', '<CMD>q<CR>', { desc = 'quit window' })
vks('n', '<LEADER>ty', '<CMD>w<CR>', { desc = 'save file' })
vks('n', '<LEADER>tr', '<CMD>q!<CR>', { desc = 'quit without saving' })
vks('n', '<LEADER>tg', '<CMD>wq<CR>', { desc = 'save & quit' })
vks('n', '<LEADER>ta', '<CMD>wqa<CR>', { desc = 'save & quit all' })
vks('n', '<LEADER>tf', '<CMD>qa!<CR>', { desc = 'force quit Neovim' })

-- Redo
vks('n', 'U', '<C-R>')

------------------
-- DEVELOPMENT
------------------
-- Run current Python file
vks('n', '<LEADER>pr', function()
  local file = vim.fn.shellescape(vim.fn.expand('%:p'))
  vim.cmd('rightbelow vsplit | terminal python ' .. file)
end, { desc = 'run current python file '})

-- Run current Markdown file
vks('n', '<LEADER>mr', function()
  local file = vim.fn.shellescape(vim.fn.expand('%:p'))
  vim.cmd('rightbelow vsplit | terminal glow -p ' .. file)
end, { desc = 'run current markdown file '})

-- Format buffer ( LSP / RUFF )
vks('n', '<LEADER>fr', function()
  vim.lsp.buf.format({ async = true })
end, { desc = 'format buffer' })

------------------
-- FILE EXPLORERS
------------------
-- Oil
vks('n', '-', '<CMD>Oil<CR>', { desc = 'open parent directory (Oil)' })
vks('n', '<LEADER>-', '<CMD>Oil --float<CR>', { desc = 'open Oil (float)' })

-- MiniFiles
vks('n', '<LEADER>=', '<CMD>lua MiniFiles.open()<CR>', { desc = 'open MiniFiles' })

------------------
-- NOICE
------------------
vks('n', '<LEADER>nl', function()
  require('noice').cmd('last')
end, { desc = 'Noice: last message' })

vks('n', '<LEADER>nh', function()
  require('noice').cmd('history')
end, { desc = 'Noice: message history' })

vks('n', '<LEADER>nd', function()
  require('noice').cmd('dismiss')
end, { desc = 'Noice: dismiss messages' })

------------------
-- TODO COMMENTS
------------------
vks('n', ']t', function()
  require('todo-comments').jump_next()
end, { desc = 'Next TODO comment' })

vks('n', '[t', function()
  require('todo-comments').jump_prev()
end, { desc = 'Prev TODO comment' })

--------------------------------------------
-- PERSISTENCE ( session ) ( <LEADER>p* )
--------------------------------------------
vks('n', '<LEADER>pl', function() require('persistence').load() end, { desc = 'load session (cwd)' })
vks('n', '<LEADER>ps', function() require('persistence').select() end, { desc = 'select session' })
vks('n', '<leader>pL', function() require('persistence').load({ last = true }) end, { desc = 'load last session' })
vks('n', '<leader>pd', function() require('persistence').stop() end, { desc = 'stop session saving' })

--------------------------------------------
-- BUFFERLINE JUMP TABS 1-9
--------------------------------------------
for i = 1, 9 do
  vks('n', '<LEADER>' .. i, function ()
    require('bufferline').go_to(i, true)
  end, { desc = 'go to tab ' .. i })
end

------------
-- QUARTO
------------
local ok, runner = pcall(require, 'quarto.runner')
if ok then
vks('n', '<leader>qp', '<CMD>QuartoPreview<CR>', { desc = 'quarto preview', silent = true, noremap = true })
vks('n', '<LEADER>qc', runner.run_cell, { desc = 'run cell', silent = true })
vks('n', '<LEADER>qa', runner.run_above, { desc = 'run cell and above', silent = true })
vks('n', '<LEADER>ql', runner.run_line, { desc = 'run line', silent = true })
vks('v', '<LEADER>qs', runner.run_range, { desc = 'run visual range', silent = true })
vks('n', '<LEADER>qA', function()
  runner.run_all(true)
end, { desc = 'run all cells (all languages)', silent = true })
end

------------
-- MOLTEN
------------
vks('n', '<LEADER>mi', '<CMD>MoltenInit<CR>', { desc = 'Molten: initialize kernel', silent = true })
vks('n', '<LEADER>mc', '<CMD>MoltenEvaluateOperator<CR>', { desc = 'Molten: evaluate selection', silent = true })
vks('n', '<LEADER>ml', '<CMD>MoltenEvaluateLine<CR>', { desc = 'Molten: evaluate line', silent = true })
vks('v', '<LEADER>mv', '<CMD><C-u>MoltenEvaluateVisual<CR>gv', { desc = 'Molten: evaluate visual selection', silent = true })
vks('n', '<LEADER>mo', '<CMD>noautocmd MoltenEnterOutput<CR>', { desc = 'Molten: open output', silent = true })
vks('n', '<LEADER>mh', '<CMD>MoltenHideOutput<CR>', { desc = 'Molten: hide output', silent = true })
vks('n', '<LEADER>md', '<CMD>MoltenDelete<CR>', { desc = 'Molten: delete cell', silent = true })

-- ============================================
-- CELL NAVIGATION ( # %% )
-- ============================================

local function goto_next_cell()
  local cur = vim.api.nvim_win_get_cursor(0)[1]
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

  for i = cur + 1, #lines do
    if lines[i]:match("^# %%%%") then
      vim.api.nvim_win_set_cursor(0, { i + 1, 0 })
      return
    end
  end
end

local function goto_prev_cell()
  local cur = vim.api.nvim_win_get_cursor(0)[1]
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

  -- Step 1: find the start of the current cell
  local current_cell_start = nil
  for i = cur, 1, -1 do
    if lines[i]:match("^# %%%%") then
      current_cell_start = i
      break
    end
  end

  if not current_cell_start then
    return
  end

  -- Step 2: find the previous cell before it
  for i = current_cell_start - 1, 1, -1 do
    if lines[i]:match("^# %%%%") then
      vim.api.nvim_win_set_cursor(0, { i + 1, 0 })
      return
    end
  end
end
vks('n', '<LEADER>mn', goto_next_cell, { desc = 'go to next cell', silent = true })
vks('n', '<LEADER>mp', goto_prev_cell, { desc = 'go to previous cell', silent = true })
