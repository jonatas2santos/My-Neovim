return {
  'GCBallesteros/jupytext.nvim',
  -- Load only when opening notebooks or using jupytext commands
  lazy=true,
  opts = {
    -- Use hydrogen-style cell markers ( # %% )
    style = 'hydrogen',
    -- Automatically choose output extension based on the input file
    output_extension = 'auto',
  },
}
