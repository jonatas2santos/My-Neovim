return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      -- Lua configuration files
      lua = { 'stylua' },

      -- Python ( Data science focused )
      -- Ruff handles formatting, fixes and import organization
      python = {
        'ruff_format',
        'ruff_fix',
        'ruff_organize_import',
      },
    },

    -- Disable automatic formatting on save
    format_on_save = false,
  },
}
