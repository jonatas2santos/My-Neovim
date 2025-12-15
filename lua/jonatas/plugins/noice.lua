return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {
    -- Improve LSP markdown rendering using Treesitter
    lsp = {
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
      },
    },
    -- UI behavior presets
    presets = {
      -- Keep command palette centered and clean
      command_palette = true,     -- position the cmdline and popupmenu together
      -- Keep default Neovim search UI
      bottom_search = false,      -- use a classic bottom cmdline for search
      -- Send very long messages ( e.g. Python tracebacks ) to a split
      long_message_to_split = true, -- long messages will be sent to a split
      -- No extra borders to avoid visual noise
      lsp_doc_border = false,     -- add a border to hover docs and signature help
    },
  },
  dependencies = {
    -- UI framework used by Noice
    'MunifTanjim/nui.nvim',
    -- Notifications with theme coherence
    'rcarriga/nvim-notify',
  },
}
