return {
  'L3MON4D3/LuaSnip',
  -- follow latest release.
  version = 'v2.*',
  -- Optional: install jsregexp for advanced snippets
  build = 'make install_jsregexp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  config = function ()
    local ls = require('luasnip')

    -- Load snippets from friendly-snippets
    require('luasnip.loaders.from_vscode').lazy_load()
    -- Load custom snippets
    require('luasnip.loaders.from_lua').lazy_load( { paths = '~/.config/nvim/snippets' })

    -- Snippet keymaps ( Alt-based, hjkl-friendly )
    vim.keymap.set({'i'}, '<A-u>', function() if ls.expandable() then ls.expand() end end, { silent = true, desc = 'expand Snippet' })
    vim.keymap.set({'i', 's'}, '<A-j>', function() ls.jump( 1) end, { silent = true, desc = 'jump to next Snippet field' })
    vim.keymap.set({'i', 's'}, '<A-k>', function() ls.jump(-1) end, { silent = true, desc = 'jump to prev Snippet field' })

    vim.keymap.set({'i', 's'}, '<A-l>', function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, { silent = true, desc = 'cycle Snippet choice' })
  end,
}
