return {
  'benlubas/molten-nvim',
  -- Lock to v1 to avoid breaking changes from v2+
  version = '^1.0.0',
  -- Image rendering support ( plots, figures, etc. )
  dependencies = { '3rd/image.nvim' },
  -- Required for Molten remote plugin
  build = ':UpdateRemotePlugins',

  init = function()
    -- Use image.nvim to render outputs ( matplotlib etc. )
    vim.g.molten_image_provider = 'image.nvim'
    -- Output window behavior
    vim.g.molten_output_win_max_height = 20
    vim.g.molten_auto_open_output = true
    -- Cleaner output formatting
    vim.g.molten_wrap_output = false
    vim.g.molten_output_show_exec_time = false
    -- Virtual text configuration
    -- Disabled to avoid clutter and layout shifts
    vim.g.molten_virt_text_output = false
    vim.g.molten_virt_text_max_lines = 8
    vim.g.molten_output_virt_lines = false
    vim.g.molten_virt_lines_off_by_1 = true
    -- Minimal UI
    vim.g.molten_output_win_border = 'none'
    -- Automatically initialize kernel on compatible files
    vim.g.molten_auto_init_behavior = 'init'
    -- NOTE:
    -- Requires a Python environment with ipykernel installed
    -- Example:
    -- pip install ipykernel
    -- python -m ipykernel install --user --name myenv
  end,
}
