return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    preset = 'helix',
    delay = 500,
    -- Minimal UI (no key icons)
    icons = { mappings = false },
    spec = {
      { '<leader>f', group = 'Find' },
      { '<leader>s', group = 'Search / Split' },
      { '<leader>g', group = 'Git' },
      { '<leader>b', group = 'Buffers' },
      { '<leader>x', group = 'Diagnostics / Trouble' },

      -- Workflow / sessions
      { '<leader>p', group = 'Persistence' },
      { '<leader>t', group = 'Exit' },

      -- Navigation / structure
      { '<leader>a', group = 'Tabs' },
      { '<leader>c', group = 'Change directory' },

      -- Dev / execution
      { '<leader>r', group = 'Run / Replace' },
      { '<leader>m', group = 'Molten' },
      { '<leader>q', group = 'Home / Quarto' },

      -- UI
      { '<leader>n', group = 'Noice' },

      -- Others
      { '<leader>l', group = 'LazyGit / List' },
      { '<leader>u', group = 'Undo' },
    },
  },
  keys = {
    {
      '<leader>?',
      function()
        require('which-key').show({ global = false })
      end,
      desc = 'Buffer Local Keymaps (which-key)',
    },
  },
}
