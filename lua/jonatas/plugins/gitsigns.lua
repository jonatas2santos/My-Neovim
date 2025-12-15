return {
  'lewis6991/gitsigns.nvim',
  opts = {
    -- Gutter signs
    signs                        = {
      add          = { text = '+' },
      change       = { text = '┃' },
      delete       = { text = '-' },
      topdelete    = { text = '‾' },
      changedelete = { text = '~' },
      untracked    = { text = '┆' },
    },
    signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
    numhl                        = true,  -- Toggle with `:Gitsigns toggle_numhl`
    linehl                       = false,  -- Toggle with `:Gitsigns toggle_linehl`
    word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir                 = {
      follow_files = true
    },
    auto_attach                  = true,
    attach_to_untracked          = false,
    -- Inline blame ( useful for learning and review )
    current_line_blame           = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts      = {
      virt_text = true,
      virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      delay = 800,
      ignore_whitespace = false,
      virt_text_priority = 100,
      use_focus = true,
    },
    current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
    max_file_length              = 40000, -- Disable if file is longer than this (in lines)
    preview_config               = {
      style = 'minimal',
      relative = 'cursor',
      row = 0,
      col = 1
    },

    -- Minimal keymaps
    on_attach                    = function(bufnr)
      local gitsigns = require('gitsigns')

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end


      -- Toggle inline blame
      map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = "toggle git blame" })

      -- Git hunk text object
      map({ 'o', 'x' }, 'ih', gitsigns.select_hunk)
    end
  },
}
