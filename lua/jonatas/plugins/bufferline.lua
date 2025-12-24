return {
  'akinsho/bufferline.nvim',
  -- Always use the latest stable version
  version = '*',
  -- File icons support
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function ()
    require('bufferline').setup({
      options = {
        -- Use tabs instead of buffers
        -- This matches a document-centric workflow
        mode = 'tabs',
        -- Always keep the tabline visible
        -- Provides a stable UI even with a single file open
        always_show_bufferline = true,
        -- Subtle separators for better readability
        separator_style = 'thin',
        -- Show ordinal numbers (1, 2, 3...) for tabs
        numbers = 'ordinal',
        -- Visual indicator for the active tab
        indicator = {
          style = 'underline'
        },
        -- Show tab actions on hover
        hover = {
          enabled = true,
          delay = 200,
          reveal = { 'close' },
        },
        -- Show LSP diagnostics directly on tabs
        diagnostics = 'nvim_lsp',
        -- Update diagnostics immediately when events occur
        diagnostics_update_on_event = true,
        -- Custom diagnostics indicator with clear icons
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
