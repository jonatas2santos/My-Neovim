return {
  'GCBallesteros/jupytext.nvim',
  -- Load only when opening notebooks or using jupytext commands
  -- Keeps Neovim startup fast
  lazy = true,
  opts = {
    -- Use hydrogen-style cell markers ( # %% )
    -- Standard format for Python Data Science workflows
    style = 'hydrogen',
    -- Automatically select output extension
    -- Allows seamless conversion between .py and .ipynb
    output_extension = 'auto',
  },
}
