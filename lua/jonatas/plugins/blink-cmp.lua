return {
  'saghen/blink.cmp',
  -- Snippet collection used by the completion engine
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      -- Use the 'super-tab' preset:
      preset = 'super-tab',
      -- Navigate completion items using Alt + j/k
      ['<A-k>'] = { 'select_prev', 'fallback' },
      ['<A-j>'] = { 'select_next', 'fallback' },
      -- Manually open completion menu showing only snippets
      -- Useful when writing boilerplate or repetitive code
      ['<A-l>'] = { function(cmp) cmp.show({ providers = { 'snippets' } }) end },
    },

    appearance = {
      -- Use mono glyphs to match Nerd Font Mono
      nerd_font_variant = 'mono',
    },

    completion = {
      -- Do not automatically show documentation popup
      -- Documentation is shown only when explicitly requested
      documentation = { auto_show = false },
    },

    sources = {
      -- Default completion sources
      -- LSP is prioritized, followed by snippets, paths and buffer words
      default = { 'lsp', 'snippets', 'path',  'buffer' },
    },

    fuzzy = {
      -- Prefer the Rust-based fuzzy matcher for better performance
      -- Falls back with a warning if not available
      implementation = 'prefer_rust_with_warning',
    },
  },

  -- Allow extending the default sources list from other configs
  opts_extend = { 'sources.default' }
}
