return {
  -- mini-files
  {
    'nvim-mini/mini.files',
    version = false,
    opts = {
      mappings = {
        close       = 'q',
        go_in       = 'l',
        go_in_plus  = 'L',
        go_out      = 'h',
        go_out_plus = 'H',
        mark_goto   = "'",
        mark_set    = 'm',
        reset       = '<BS>',
        reveal_cwd  = '@',
        show_help   = 'g?',
        synchronize = '=',
        trim_left   = '<',
        trim_right  = '>',
      },
      -- General options
      options = {
        -- Whether to delete permanently or move into module-specific trash
        permanent_delete = true,
        -- Whether to use for editing directories
        use_as_default_explorer = false,
      },
    },
  },

  -- mini-pairs
  {
    'nvim-mini/mini.pairs',
    version = false,
    opts = {},

  },

  -- mini-surround
  {
    'nvim-mini/mini.surround',
    version = false,
    opts = {
      mappings = {
        add = 'sa',        -- Add surrounding in Normal and Visual modes
        delete = 'sd',     -- Delete surrounding
        find = 'sf',       -- Find surrounding (to the right)
        find_left = 'sF',  -- Find surrounding (to the left)
        highlight = 'sh',  -- Highlight surrounding
        replace = 'sr',    -- Replace surrounding

        suffix_last = 'l', -- Suffix to search with "prev" method
        suffix_next = 'n', -- Suffix to search with "next" method
      },
    },
  },

  -- mini-splitjoin
  {
    'nvim-mini/mini.splitjoin',
    version = false,
    opts = {
      mappings = {
        toggle = 'gS',
        split = '',
        join = '',
      },
    }
  }
}
