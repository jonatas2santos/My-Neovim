return {
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufReadPre', 'BufNewFile' },
  build = ':TSUpdate',
  opts = {
    -- Enable Tressitter-based syntax highlighting
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    -- Enable Tressitter-based indentation
    indent = { enable = true },
    -- Parsers required for data science, docs and Neovim config
    ensure_installed = {
      'c',
      'vim',
      'vimdoc',
      'query',
      'markdown',
      'markdown_inline',
      'python',
    },
    -- Incremental selection ( rarely used, but useful when needed )
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = 'gn',
        node_incremental = 'gn',
        scope_incremental = 'gN',
        node_decremental = 'g<BS>',
      },
    },
  },
}
