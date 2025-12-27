return {
  -- Collection of lightweight Mini.nvim modules

  -- mini-files: File explorer (secondary, Oil is primary)
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
      options = {
        -- Do not replace default file explorer ( Oil is primary )
        use_as_default_explorer = false,
        -- Delete files permanently ( NO TRASH )
        permanent_delete = true,
      },
    },
  },

  -- mini-pairs: Automatic pairs for brackets and quotes
  {
    'nvim-mini/mini.pairs',
    version = false,
    opts = {},
  },

  -- mini-surround: Surround text objects
  {
    'nvim-mini/mini.surround',
    version = false,
    opts = {
      mappings = {
        add = 'ysa',        -- Add surrounding in Normal and Visual modes
        delete = 'ysd',     -- Delete surrounding
        find = 'ysf',       -- Find surrounding (to the right)
        find_left = 'ysF',  -- Find surrounding (to the left)
        highlight = 'ysh',  -- Highlight surrounding
        replace = 'ysr',    -- Replace surrounding

        suffix_last = 'l', -- Suffix to search with "prev" method
        suffix_next = 'n', -- Suffix to search with "next" method
      },
    },
  },

  -- mini-splitjoin: Split / join code structures
  {
    'nvim-mini/mini.splitjoin',
    version = false,
    opts = {
      mappings = {
        -- Toggle between single-line and multi-line constructs
        toggle = 'gS',
        split = '',
        join = '',
      },
    },
  },

  -- mini-icons: Shared icon provider (used by supported plugins)
  {
    'nvim-mini/mini.icons',
    version = false,
    opts = {
      style = 'glyph',
    },
  },
}
