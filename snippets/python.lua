local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -----------------------------
  --      NOTEBOOK CELL      --
  -----------------------------
  s('cc', {
    t('# %% '),
    t({ '','' }),
    i(1, 'cell'),
    t({ '','' }),
  }),

  -----------------------------
  -- DATA SCIENCE BASE SETUP --
  -----------------------------
  s('ds', {
    t({
      'import pandas as pd',
      'import numpy as np',
      '',
      -- improve dataframe display for wide tables
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
    i(1, 'df'),
    t(" = pd.read_csv('"),
    i(2, 'file.csv'),
    t("')"),
    i(0),
  }),

  -----------------------------
  --   DATAFRAME INSPECTION  --
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

  s('describe', {
    i(1, 'df'),
    t('.describe()'),
  }),

  s('phead', {
    t('print('),
    i(1, 'df'),
    t('.head())'),
  }),
}
