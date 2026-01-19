-- ============================================
-- LUALINE CONFIGURATION
-- Loads custom lualine setup from lualine_config.lua
-- ============================================

return {
  'nvim-lualine/lualine.nvim',
  dependencies = 'nvim-mini/mini.icons',
  opts = function()
    -- Load the user-defined lualine configuration
    return require('jonatas.config.lualine_config').build()
  end,
}
