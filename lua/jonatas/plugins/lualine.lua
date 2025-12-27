return {
  'nvim-lualine/lualine.nvim',
  dependencies = 'nvim-mini/mini.icons',
  opts = function ()
    -- Custom highlight for the clock component
    vim.api.nvim_set_hl(0, 'Clock_Color', {
      fg = '#161616',
      bg = '#78a9ff',
    })

    -- Clock component with day/night icon
    local clock_kiki = {
      function()
        local now = os.date('*t')
        local hour = now.hour
        local icon = (hour < 16) and '' or ''
        return string.format('%s %02d:%02d', icon, hour, now.min)
      end,
      color = 'Clock_Color',
      separator = { left = '', right = '' },
      padding = 1,
    }

    -- Safe noice integration
    local noice_ok, noice = pcall(require, 'noice')

    return {
      options = {
        theme = 'oxocarbon',
        component_separators = '',
        section_separators = { left = '', right = '' },
      },

      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff' },
        lualine_c = { 'filename',
        -- Macro recording indicator
        function()
          local reg = vim.fn.reg_recording()
          if reg == '' then
            return ''
          end
          return 'recording macro @' .. reg
        end,
      },
      lualine_x = {
        -- Lazy updates status
        {
          require('lazy.status').updates,
          cond = require('lazy.status').has_updates,
          color = { fg = '#ff9e64' },
        },
        -- Noice command status
        {
          function ()
            return noice.api.status.command.get()
          end,
          cond = function ()
            return noice_ok and noice.api.status.command.has()
          end,
          color = { fg = '#78a9ff' },
        },
        'filetype' },
        lualine_y = { 'location' },
        lualine_z = { clock_kiki },
      },
    }
  end,
}
