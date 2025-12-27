return {
  '3rd/image.nvim',
  build = false,
  opts = {
    -- Best backend for Wayland environments
    backend = 'ueberzug',
    -- Use ImageMagick CLI for image processing
    processor = 'magick_cli',

    integrations = {
      -- Enable image rendering inside Markdown files
      markdown = {
        enabled = true,
        only_render_image_at_cursor = true,
        only_render_image_at_cursor_mode = 'inline',
        floating_windows = true,
      },
      -- Disable Neorg integration (not used in this setup)
      neorg = {
        enabled = false,
      },
    },

    -- Image size limits
    max_width = 100,
    max_height = 12,
    -- Allow images to overflow window if needed
    max_width_window_percentage = math.huge,
    max_height_window_percentage = math.huge,
    -- Clear images when overlapping floating windows
    window_overlap_clear_enabled = true,
    window_overlap_clear_ft_ignore = {
      'cmp_menu',
      'cmp_docs',
      'snacks_notif',
      'scrollview',
      'scrollview_sign',
    },
  },
}
