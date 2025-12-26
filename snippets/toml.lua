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
      -- allow wider lines for data science workflows
      'line-length = 120',
      '',
      '[tool.ruff.lint]',
      -- enable essential linting rules
      'extend-select = ["E", "F", "I"]',
      -- ignore line length violations
      'ignore = ["E501"]',
      '',
      '[tool.ruff.format]',
      -- formatting preferences
      'quote-style = "single"',
      'indent-style = "space"',
      '',
    }),
    i(0),
  }),
}
