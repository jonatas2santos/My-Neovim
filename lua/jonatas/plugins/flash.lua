return {
  'folke/flash.nvim',
  -- Load lazily to reduce startup time
  event = 'VeryLazy',

  ---@type Flash.Config
  opts = {
    jump = {
      -- Clear search highlights after jumping
      -- Keeps the screen clean for reading and studying
      nohlsearch = true,
      -- Disable automatic jumps
      -- Improves predictability and control
      autojump = false,
    },

    label = {
      -- Exclude 'q' to avoid triggering macro recording
      exclude = 'q',
      -- Disable rainbow labels to reduce visual noise
      rainbow = {
        enabled = false,
      },
    },

    modes = {
      -- Enable Flash integration with search (/)
      -- Provides a consistent navigation experience
      search = {
        enabled = true,
      },
    },

    char = {
      -- Show jump labels for single-character motions
      jump_labels = true,
    },
 },

  keys = {
    -- Main Flash jump
    -- Works in normal, visual and operator-pending modes
    { 's', mode = { 'n', 'x', 'o' }, function() require('flash').jump() end, desc = 'Flash' },
    -- Treesitter-based jump
    -- Useful for structured navigation in code
    { 'S', mode = { 'n', 'x', 'o' }, function() require('flash').treesitter() end, desc = 'Flash Treesitter' },
    -- Remote jump (operator-pending)
    { 'r', mode = 'o', function() require('flash').remote() end, desc = 'Remote Flash' },
    -- Treesitter search jump
    { 'R', mode = { 'o', 'x' }, function() require('flash').treesitter_search() end, desc = 'Treesitter Search' },
    -- Toggle Flash integration in command-line search
    { '<C-s>', mode = { 'c' }, function() require('flash').toggle() end, desc = 'Toggle Flash Search' },
  },
}
