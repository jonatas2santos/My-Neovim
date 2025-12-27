return {
  -- Enhanced UI for messages, cmdline and LSP interactions
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {
    -- Improve LSP markdown rendering using Treesitter
    lsp = {
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
        ['cmp.entry.get_documentation'] = true,
      },
    },
    -- UI behavior presets
    presets = {
      -- Centered command palette with popup menu
      command_palette = true,
      -- Use Noice UI instead of classic bottom cmdline
      bottom_search = false,
      -- Send very long messages ( e.g. Python tracebacks ) to a split
      long_message_to_split = true,
      -- No extra borders to avoid visual noise
      lsp_doc_border = false,
    },

    -- Optional: filter out noisy messages
    routes = {
      {
        filter = {
          event = 'msg_show',
          kind = '',
          find = 'written',
        },
        opts = { skip = true },
      },
    },
  },

  dependencies = {
    -- UI framework used by Noice
    'MunifTanjim/nui.nvim',
    -- Notifications with theme coherence
    'rcarriga/nvim-notify',
  },
}
