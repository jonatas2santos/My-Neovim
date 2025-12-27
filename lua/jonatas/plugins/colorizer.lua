return {
  'norcalli/nvim-colorizer.lua',
  opts = {
    -- Apply color highlighting only to specific filetypes
    -- Keeps visual noise low in data science workflows
    filetypes = {
      'css',
      'scss',
      'html',
      'lua',
      'toml',
      'yaml',
      'markdown',
      'quarto',
    },
    DEFAULT_OPTIONS = {
      RGB      = true;         -- #RGB hex codes
      RRGGBB   = true;         -- #RRGGBB hex codes
      names    = true;         -- "Name" codes like Blue
      RRGGBBAA = false;        -- #RRGGBBAA hex codes
      rgb_fn   = false;        -- CSS rgb() and rgba() functions
      hsl_fn   = false;        -- CSS hsl() and hsla() functions
      css      = false;        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
      css_fn   = false;        -- Enable all CSS *functions*: rgb_fn, hsl_fn
      -- Render colors as background blocks
      mode     = 'background';
    },
  },
}
