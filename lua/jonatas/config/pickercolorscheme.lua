-- =======================================================
-- COLORSCHEME PICKER
-- Handles saving, loading, and selecting colorschemes
-- =======================================================

local M = {}

-- ============================================
-- State file
-- Path to store the last selected colorscheme
-- ============================================

local STATE_PATH = vim.fn.stdpath('config')
.. '/lua/jonatas/config/colorscheme_state.lua'

local STATE_DIR = vim.fn.fnamemodify(STATE_PATH, ':h')

-- =========================
-- Load / Save functions
-- =========================

local function load_state()
  local ok, state = pcall(dofile, STATE_PATH)
  if ok and type(state) == 'table' and type(state.current) == 'string' then
    return state.current
  end
  -- Default colorscheme if state file missing or invalid
  return 'catppuccin'
end

local function save_state(name)
  -- Ensure directory exists
  vim.fn.mkdir(STATE_DIR, 'p')

  local data = {
    'return {',
    "	current = '" .. name .. "',",
    '}',
  }

  vim.fn.writefile(data, STATE_PATH)
end

-- =========================
-- Apply colorscheme
-- =========================

M.current = load_state()

function M.set(name)
  if not name or name == '' then
    return
  end

  M.current = name
  vim.cmd.colorscheme(name)
  save_state(name)
end

function M.setup()
  M.set(M.current)
end

-- =======================================================
-- Simple Colorscheme Picker
-- Uses built-in vim.ui.select, without Snacks picker
-- =======================================================

function M.picker()
  local themes = vim.fn.getcompletion('', 'color')

  local original = vim.g.colors_name

  vim.ui.select(themes, {
    prompt = 'Colorscheme',
  }, function(choice)
    if choice then
      M.set(choice)
    else
      -- Restore original colorscheme if selection canceled
      if original then
        pcall(vim.cmd.colorscheme, original)
      end
    end
  end)
end

return M
