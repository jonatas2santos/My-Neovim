return {
  'lewis6991/gitsigns.nvim',
  opts = {
    -- Signs displayed in the gutter
    -- Minimal and non-distracting
    signs = {
      add          = { text = '+' },
      change       = { text = '┃' },
      delete       = { text = '-' },
      topdelete    = { text = '‾' },
      changedelete = { text = '~' },
      untracked    = { text = '┆' },
    },

    -- Enable sign column
    signcolumn = true,
    -- Highlight line numbers instead of entire lines
    numhl = true,
    linehl = false,
    word_diff = false,

    -- Git directory tracking
    watch_gitdir = {
      follow_files = true,
    },

    -- Automatically attach to git buffers
    auto_attach = true,
    -- Do not attach to untracked files
    attach_to_untracked = false,
    -- Inline blame configuration
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      delay = 800,
      ignore_whitespace = false,
      virt_text_priority = 100,
      use_focus = true,
    },

    -- Blame text format
    current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
    -- Performance guard
    max_file_length = 40000,

    -- Floating preview window configuration
    preview_config = {
      style = 'minimal',
      relative = 'cursor',
      row = 0,
      col = 1
    },

    -- Keymaps
    on_attach = function(bufnr)
      local gitsigns = require('gitsigns')

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end


      -- Toggle inline blame
      map('n', '<leader>gB', gitsigns.toggle_current_line_blame, { desc = 'toggle git blame' })

      -- Git hunk text object
      -- Allows selecting a hunk in operator-pending or visual mode
      map({ 'o', 'x' }, 'ih', gitsigns.select_hunk)
    end,
  },
}
