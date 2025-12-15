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
    -- Do not auto-open output window ( manual control )
    vim.g.molten_auto_open_output = true
    -- Disable line wrapping in outputs ( better for numbers / tables )
    vim.g.molten_wrap_output = false
    -- Show small outputs as virtual text inline
    vim.g.molten_virt_text_output = true
    -- Fix off-by-one visual issue with virtual lines
    vim.g.molten_virt_lines_off_by_1 = true
    -- Automatically initialize kernel when opening a compatible file
    vim.g.molten_auto_init_behavior = "init"
    -- Limit number of virtual text lines shown inline
    vim.g.molten_virt_text_max_lines = 3
  end,
}
