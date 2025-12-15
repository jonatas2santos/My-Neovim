return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
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
      color = "Clock_Color",
      separator = { left = '', right = '' },
      padding = 1,
    }

    return {
    options = {
      theme = 'oxocarbon',
      component_separators = '',
      section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff', 'diagnostics' },
      lualine_c = { 'filename',
          -- Show active macro recording
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
          color = { fg = '#ff9e64' }
        },
        {
            -- Noice command status
          require('noice').api.status.command.get,
          cond = require('noice').api.status.command.has,
          color = { fg = '#78a9ff' },
        },
        'filetype' },
      lualine_y = { 'location' },
      lualine_z = { clock_kiki }
    },
  }
  end,
}
