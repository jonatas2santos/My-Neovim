return {
  'folke/trouble.nvim',
  cmd = 'Trouble',
  opts = {
    auto_preview = false,
    focus = true,
    use_diagnostic_signs = true,
  },
  keys = {
    {
      '<leader>xx',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'diagnostics (project)',
    },
    {
      '<leader>xb',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = 'diagnostics (buffer)',
    },
    {
      '<leader>xs',
      '<cmd>Trouble symbols toggle focus=false<cr>',
      desc = 'symbols',
    },
  },
}
