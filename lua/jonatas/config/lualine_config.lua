local M = {}
function M.build()
  local colors = require('jonatas.config.lualinechange')
  require('jonatas.config.lualine_highlights').apply(colors)

  -- =========================
  -- Mode map
  -- =========================
  local mode_map = {
    n  = { label = 'NORMAL',  icon = '', hl = 'Mode_Normal'  },
    i  = { label = 'INSERT',  icon = '', hl = 'Mode_Insert'  },
    v  = { label = 'VISUAL',  icon = '󰈈', hl = 'Mode_Visual'  },
    V  = { label = 'V-LINE',  icon = '󰈈', hl = 'Mode_Visual'  },
    [''] = { label = 'V-BLOCK', icon = '󰈈', hl = 'Mode_Visual' },
    R  = { label = 'REPLACE', hl = 'Mode_Replace' },
    c  = { label = 'COMMAND', hl = 'Mode_Command' },
    o  = { label = 'OP-PENDING', hl = 'Mode_OpPending' },
  }

  -- =========================
  -- Mode component
  -- =========================

  local function get_mode_key()
    local m = vim.api.nvim_get_mode().mode

    -- Operator-pending mode (waiting for motion like c, d, y)
    if m:match('^no') then
      return 'o'
    end

    -- Command-line mode (:, /, ?)
    if m:match('^c') then
      return 'c'
    end

    -- Visual block
    if m:match('') then
      return ''
    end

    -- Fallback: first letter of mode
    return m:sub(1, 1)
  end

  local mode_kiki = {
    function()
      local key = get_mode_key()
      local data = mode_map[key] or mode_map.n

      if data.icon then
        return string.format('%s %s', data.icon, data.label)
      end

      return data.label
    end,

    color = function()
      local key = get_mode_key()
      local data = mode_map[key] or mode_map.n
      return data.hl
    end,

    separator = { left = '', right = '' },
    padding = 1,
  }

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

  -- Safe Noice integration
  local noice_ok, noice = pcall(require, 'noice')

  return {
    options = {
      theme = 'auto',
      component_separators = '',
      section_separators = { left = '', right = '' },
      -- section_separators = { left = '', right = '' },
    },

    sections = {
      lualine_a = { mode_kiki },
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
end

return M
