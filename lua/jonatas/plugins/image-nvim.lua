return {
  '3rd/image.nvim',
  build = false, -- Avoid building the rock ( know upstream issue )
  opts = {
    -- Best backend for Wayland
    backend = 'ueberzug',
    -- Image processing
    processor = 'magick_cli',

    integrations = {
      markdown = {
        enabled = true,
      },
      neorg = {
        enabled = false,
      },
    },
    -- Image size limits
    max_width = 100,
    max_height = 12,
    -- Allow images to exceed window size if needed
    max_width_window_percentage = math.huge,
    max_height_window_percentage = math.huge,
    -- Clear images when windows overlap
    window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
    window_overlap_clear_ft_ignore = { 'cmp_menu', 'cmp_docs', 'snacks_notif', 'scrollview', 'scrollview_sign' },
  },
}
