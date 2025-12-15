return {
  'folke/persistence.nvim',
  event = 'BufReadPre',
  opts = {
    -- Save sessions automatically when opening real files
    -- Sessions restore is manual to avoid unexpected context switches
  },
}
