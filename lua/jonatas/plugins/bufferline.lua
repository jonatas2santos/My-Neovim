return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function ()
    require('bufferline').setup({
      options = {
        -- Use tabs instead of buffers
        mode = 'tabs',
        -- Always show the tabline
        always_show_bufferline = true,
        -- Subtle separators
        separator_style = 'thin',
        -- Show ordinal numbers (1, 2, 3...) for tabs
        numbers = 'ordinal',
        -- Active tab indicator
        indicator = {
          style = 'underline'
        },
        -- Hover behavior
        hover = {
          enabled = true,
          delay = 200,
          reveal = { 'close' },
        },
        -- Show LSP diagnostics directly on tabs
        diagnostics = 'nvim_lsp',
        -- Update diagnostics immediately when events occur
        diagnostics_update_on_event = true,
        -- Custom diagnostics indicator icons
        diagnostics_indicator = function (_, _, diagnostics_dict)
          local s = ''
          if diagnostics_dict.error then
            s = s .. '' .. diagnostics_dict.error .. ' '
          end
          if diagnostics_dict.warning then
            s = s .. '' .. diagnostics_dict.warning .. ' '
          end
          if diagnostics_dict.info then
            s = s .. '󰋼' .. diagnostics_dict.info .. ' '
          end
          if diagnostics_dict.hint then
            s = s .. '' .. diagnostics_dict.hint .. ' '
          end
          return s ~= '' and s or nil
        end,
      },
    })
  end,
}
