return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      -- Tab to accept completion
      preset = 'super-tab',

      ['<A-k>'] = { 'select_prev', 'fallback' },
      ['<A-j>'] = { 'select_next', 'fallback' },

      -- show with a list of providers
      ['<A-l>'] = { function(cmp) cmp.show({ providers = { 'snippets' } }) end },

    },

    appearance = {
      -- Use mono variant for Nerd Font Mono
      nerd_font_variant = 'mono'
    },

    -- (Default) Only show the documentation popup when manually triggered
    completion = { documentation = { auto_show = false } },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    -- Prefer Rust-based fuzzy matcher for better perfomance
    fuzzy = { implementation = 'prefer_rust_with_warning' }
  },
  opts_extend = { 'sources.default' }
}
