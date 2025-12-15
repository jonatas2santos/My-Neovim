local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -----------------------------
  -- DATA SCIENCE BASE SETUP --
  -----------------------------
  s('ds', {
    t({
      'import pandas as pd',
      'import numpy as np',
      '',
      "pd.set_option('display.max_columns', None)",
      "pd.set_option('display.width', 120)",
      '',
    }),
    i(0),
  }),

  ----------------------------
  --        READ CSV        --
  ----------------------------
  s('csv', {
    t(''),
    i(1, 'df'),
    t(" = pd.read_csv('"),
    i(2, 'arquivo.csv'),
    t({
      "')",
      '',
    }),
    i(0),
  }),

  -----------------------------
  -- QUICK DATAFRAME PREVIEW --
  -----------------------------
  s('head', {
    i(1, 'df'),
    t('.head()'),
  }),

  s('info', {
    i(1, 'df'),
    t('.info()'),
  }),

  s('shape', {
    i(1, 'df'),
    t('.shape'),
  }),
}
