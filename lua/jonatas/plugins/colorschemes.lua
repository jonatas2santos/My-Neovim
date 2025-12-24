return {

  -- Oxocarbon <3
  {
    -- Main colorscheme used across the entire Neovim setup
    -- Chosen for high contrast, low eye strain and long study sessions
    'nyoom-engineering/oxocarbon.nvim',
    -- Load the colorscheme immediately
    -- This avoids highlight flickering during startup
    lazy = false,
    -- High priority ensures it loads before UI plugins
    priority = 1000,
    config = function()
      -- Safely apply the colorscheme
      -- Prevents startup errors if the theme fails to load
      pcall(vim.cmd.colorscheme, 'oxocarbon')
    end,
  },

}
