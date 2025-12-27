return {
  'stevearc/conform.nvim',
  opts = {
    -- Define formatters per filetype
    formatters_by_ft = {
      -- Lua configuration files
      -- Keep formatting consistent across the Neovim config
      lua = { 'stylua' },

      -- Python ( data science focused workflow )
      -- Ruff handles formatting, fixes and imports
      python = {
        'ruff_format',
        'ruff_fix',
        'ruff_organize_import',
      },
      -- Future options (intentionally disabled)
      -- markdown = { 'prettier' },
      -- quarto = { 'prettier' },
    },

    -- Disable automatic formatting on save
    -- Formatting is triggered manually to avoid
    -- disrupting exploratory or notebook-style workflows
    format_on_save = false,
  },
}
