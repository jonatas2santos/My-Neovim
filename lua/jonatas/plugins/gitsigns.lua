return {
  'lewis6991/gitsigns.nvim',
  opts = {
    -- Signs displayed in the gutter
    -- Chosen to be minimal and non-distracting
    signs                        = {
      add          = { text = '+' },
      change       = { text = '┃' },
      delete       = { text = '-' },
      topdelete    = { text = '‾' },
      changedelete = { text = '~' },
      untracked    = { text = '┆' },
    },

    -- Enable sign column
    signcolumn = true,
    -- Highlight line numbers instead of full lines
    -- Improves readability during long study sessions
    numhl = true,
    -- Disable full line highlight to reduce visual noise
    linehl = false,
    -- Disable word-level diff highlighting
    word_diff = false,

    -- Watch git directory and follow file changes
    watch_gitdir = {
      follow_files = true
    },

    -- Automatically attach to git buffers
    auto_attach = true,
    -- Do not attach to untracked files
    -- Useful for experimental or temporary files
    attach_to_untracked = false,
    -- Inline git blame for the current line
    -- Very useful for learning and reviewing changes
    current_line_blame = true,

    current_line_blame_opts = {
      virt_text = true,
      -- Show blame text at end of line
      virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      -- Delay before showing blame
      delay = 800,
      -- Respect whitespace changes
      ignore_whitespace = false,
      -- Priority to ensure visibility
      virt_text_priority = 100,
      -- Only show blame when the window is focused
      use_focus = true,
    },

    -- Format of the inline blame text
    current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
    -- Disable gitsigns for very large files
    -- Prevents performance issues with big datasets or logs
    max_file_length = 40000,

    -- Floating preview window configuration
    preview_config = {
      style = 'minimal',
      relative = 'cursor',
      row = 0,
      col = 1
    },

    -- Minimal and intentional keymaps
    on_attach = function(bufnr)
      local gitsigns = require('gitsigns')

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end


      -- Toggle inline blame
      map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = "toggle git blame" })

      -- Git hunk text object
      -- Allows selecting a hunk in operator-pending or visual mode
      map({ 'o', 'x' }, 'ih', gitsigns.select_hunk)
    end,
  },
}
