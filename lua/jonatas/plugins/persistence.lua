return {
  'folke/persistence.nvim',
  event = 'BufReadPre',
  opts = {
    -- Directory where session files are stored
    dir = vim.fn.stdpath('state') .. '/sessions/',
    -- Save sessions automatically when opening a real file
    need = 1,
    -- Do NOT automatically restore sessions
    -- Restoring is always manual to avoid unexpected context switches
  },
}
