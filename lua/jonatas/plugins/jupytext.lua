return {
  'GCBallesteros/jupytext.nvim',
  -- Load only when needed ( keeps startup fast )
  lazy = true,
  opts = {
    -- Use hydrogen-style cell markers ( # %% )
    -- Standard format for Python Data Science workflows
    style = 'hydrogen',
    -- Automatically choose output extension ( .py <-> .ipynb )
    output_extension = 'auto',
  },
}
