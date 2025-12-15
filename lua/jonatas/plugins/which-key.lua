return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    delay = 500,
    icons = { mappings = false },
    spec = {
      { '<leader>f', group = 'Find' },
      { '<leader>s', group = 'Search' },
      { '<leader>g', group = 'Git' },
      { '<leader>x', group = 'Diagnostics / Trouble' },
      { '<leader>b', group = 'Buffers' },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
