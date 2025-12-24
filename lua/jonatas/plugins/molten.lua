return {
  'benlubas/molten-nvim',
  -- Lock to v1 to avoid breaking changes from v2+
  version = '^1.0.0',
  -- Image rendering support ( plots, figures, etc. )
  dependencies = { '3rd/image.nvim' },
  -- Required for Molten remote plugin
  build = ':UpdateRemotePlugins',

  init = function()
    -- Use image.nvim to render outputs like matplotlib plots
    vim.g.molten_image_provider = 'image.nvim'
    -- Limit output window height to avoid UI clutter
    vim.g.molten_output_win_max_height = 20
    -- Automatically open output window when needed
    vim.g.molten_auto_open_output = true
    -- Disable line wrapping in outputs ( better for numbers / tables )
    vim.g.molten_wrap_output = false
    -- Show small outputs as virtual text inline
    vim.g.molten_virt_text_output = false
    vim.g.molten_virt_text_max_lines = 8
    -- Avoid pushing code down with virtual lines
    vim.g.molten_output_virt_lines = false
    -- Fix off-by-one visual issue with virtual lines
    vim.g.molten_virt_lines_off_by_1 = true
    -- Automatically initialize kernel when opening a compatible file
    vim.g.molten_auto_init_behavior = 'init'
    -- Hide execution time to reduce visual noise
    vim.g.molten_output_show_exec_time = false
    -- Minimal UI
    vim.g.molten_output_win_border = 'none'
  end,
}
