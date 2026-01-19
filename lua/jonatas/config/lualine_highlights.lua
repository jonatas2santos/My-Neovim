local M = {}

-- Apply custom highlights for Lualine modes and clock
function M.apply()
  local colors = require('jonatas.config.lualinechange')
  -- =========================
  -- Mode highlights
  -- =========================
  vim.api.nvim_set_hl(0, 'Mode_Normal',   { fg = '#161616', bg = colors.base0E })
  vim.api.nvim_set_hl(0, 'Mode_Insert',   { fg = '#161616', bg = colors.base0D })
  vim.api.nvim_set_hl(0, 'Mode_Visual',   { fg = '#161616', bg = colors.base0F })
  vim.api.nvim_set_hl(0, 'Mode_Replace',  { fg = '#161616', bg = '#ed8796' })
  vim.api.nvim_set_hl(0, 'Mode_Command',  { fg = '#161616', bg = '#c6a0f6' })
  vim.api.nvim_set_hl(0, 'Mode_OpPending',{ fg = '#161616', bg = colors.base0E })

  -- =========================
  -- Clock highlight
  -- =========================
  vim.api.nvim_set_hl(0, 'Clock_Color', {
    fg = '#161616',
    bg = colors.base0E,
  })
end

return M
