return {
  'stevearc/conform.nvim',
  opts = {
    -- Define formatters per filetype
    formatters_by_ft = {
      -- Lua configuration files
      -- Keep formatting consistent across the Neovim config
      lua = { 'stylua' },

      -- Python (data science focused workflow)
      -- Ruff is used as a single tool for:
      -- formatting, autofixes and import organization
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
    -- LEADER + F = format
    format_on_save = false,
  },
}
