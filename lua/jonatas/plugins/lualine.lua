return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      theme = 'oxocarbon',
      component_separators = '',
      section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff', 'diagnostics' },
      lualine_c = { 'filename',
        function()
          local reg = vim.fn.reg_recording()
          if reg == "" then return "" end
          return "recording macro @" .. reg
        end,
      },
      lualine_x = {
        {
          require("lazy.status").updates,
          cond = require("lazy.status").has_updates,
          color = { fg = "#ff9e64" }
        },
        {
          require("noice").api.status.command.get,
          cond = require("noice").api.status.command.has,
          color = { fg = "#78a9ff" },
        },
        'filetype' },
      lualine_y = { 'location' },
      lualine_z = {
        {
          function()
            local now = os.date("*t")
            local hour = now.hour
            local icon
            if hour < 16 then
              icon = ""
            else
              icon = ""
            end
            return string.format("%s %02d:%02d", icon, hour, now.min)
          end,
          color = { fg = "#78a9ff" }
        }
      }
    },
  }
}
