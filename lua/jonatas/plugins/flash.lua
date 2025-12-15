return {
  'folke/flash.nvim',
  event = 'VeryLazy',

  ---@type Flash.Config
  opts = {
    jump = {
      -- Do not keep search highlights after jumping
      nohlsearch = true,
      -- Disable auto-jump for better predictability
      autojump = false,
    },
    label = {
      -- Disable rainbow labels to reduce visual noise
      rainbow = {
        enabled = false,
      },
    },
    modes = {
      -- Enable Flash integration with search (/)
      search = {
        enabled = true,
      },
    },
    char = {
      jump_labels = true,
    },
 },

  keys = {
    -- Jump binds nvim Ctrl+o/i
    { 's', mode = { 'n', 'x', 'o' }, function() require('flash').jump() end, desc = 'Flash' },
    { 'S', mode = { 'n', 'x', 'o' }, function() require('flash').treesitter() end, desc = 'Flash Treesitter' },
    { 'r', mode = 'o', function() require('flash').remote() end, desc = 'Remote Flash' },
    { 'R', mode = { 'o', 'x' }, function() require('flash').treesitter_search() end, desc = 'Treesitter Search' },
    { '<C-s>', mode = { 'c' }, function() require('flash').toggle() end, desc = 'Toggle Flash Search' },
  },
}
