-- ========================
-- Neovim entry point
-- ========================

--------------------------
-- Leader key ( space )
--------------------------
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Core options ( must be loaded first )
require('jonatas.config.options')

-- Plugins manager ( loads plugins and dependencies )
require('jonatas.config.lazy')

-- Picker colorscheme ( select colorscheme )
require('jonatas.config.pickercolorscheme').setup()

-- Global keymaps 
require('jonatas.config.keymaps')

-- Autocommands
require('jonatas.config.autocmds')

-- Small UI / diagnostic / cosmetic settings
require('jonatas.config.small-settings')

-- ============================================================
-- Listener for SIGUSR1 to hot-reload Lualine colors
--
-- This autocommand listens for the "SIGUSR1" signal. It's triggered
-- by Matugen when colors change (e.g., after wallpaper update) to
-- refresh Lualine highlights and separators without restarting Neovim
-- ============================================================
local function reload_lualine()
  -- Clear cached Lualine modules so they can be re-required
  package.loaded['jonatas.config.lualinechange'] = nil
  package.loaded['jonatas.config.lualine_config'] = nil
  package.loaded['jonatas.config.lualine_highlights'] = nil

  -- Safely require Lualine
  local ok, lualine = pcall(require, 'lualine')
  if ok then
    -- Rebuild the Lualine configuration from scratch
    local cfg = require('jonatas.config.lualine_config').build()
    lualine.setup(cfg)   -- Recreate highlights and separators
    lualine.refresh()    -- Force Lualine to redraw immediately
  end

  -- Notify the user that Lualine colors were updated
  vim.notify('Lualine: colors update', vim.log.levels.INFO)
end

vim.api.nvim_create_autocmd('Signal', {
  pattern = 'SIGUSR1',
  desc = 'Reload lualine when receiving SIGUSR1',
  callback = reload_lualine,
})

vim.api.nvim_create_autocmd('ColorScheme', {
  desc = 'Reload lualine when colorscheme changes',
  callback = reload_lualine,
})
