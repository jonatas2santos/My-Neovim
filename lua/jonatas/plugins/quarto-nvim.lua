return {
  'quarto-dev/quarto-nvim',
  dependencies = {
    'jmbuhr/otter.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {
    -- Quarto-specific LSP keybindings
    keymap = {
      hover = 'qh',
      definition = 'qd',
      rename = '<Leader>qr',
      references = 'qR',
      format = 'qf',
    },
    debug = false,
    -- Close preview windows when leaving the buffer
    closePreviewOnExit = true,
    lspFeatures = {
      enabled = true,
      -- Enable LSP for all code chunks
      chunks = 'all',
      languages = { 'python', 'bash' },
      diagnostics = {
        enabled = true,
        -- Run diagnostics only after saving to reduce noise
        triggers = { 'BufWritePost' },
      },
      completion = {
        enabled = true,
      },
    },
    -- Delegate code execution to Molten
    codeRunner = {
      enabled = true,
      default_method = 'molten',
      -- Never run non-code filetypes
      never_run = { 'yaml' },
    },
  },
}
