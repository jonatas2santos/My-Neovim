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
      options = {
        -- Do not override default directory editor ( Oil is primary )
        use_as_default_explorer = false,
        -- Delete files permanently ( No trash abstraction )
        permanent_delete = true,
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

  -- mini-splitjoin
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
}
