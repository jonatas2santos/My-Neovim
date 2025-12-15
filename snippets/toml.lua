local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  ----------------------------------
  -- PYPROJECT.TOML (RUFF CONFIG) --
  ----------------------------------
  s('ruff', {
    t({
      '[tool.ruff]',
      'line-length = 120',
      '',
      '[tool.ruff.lint]',
      'extend-select = [\"E\", \"F\", \"I\"]',
      'ignore = [\"E501\"]',
      '',
      '[tool.ruff.format]',
      'quote-style = \"single\"',
      'indent-style = \"space\"',
      '',
    }),
    i(0)
  }),
}
