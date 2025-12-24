return {
  '3rd/image.nvim',
  -- Disable building native rock
  -- Avoids known upstream build issues
  build = false,
  opts = {
    -- Best backend for Wayland
    backend = 'ueberzug',
    -- Use ImageMagick CLI for image processing
    -- Stable and reliable for resizing and rendering
    processor = 'magick_cli',

    integrations = {
      -- Enable image rendering inside Markdown files
      -- Useful for study notes, documentation and Quarto previews
      markdown = {
        enabled = true,
      },
      -- Disable Neorg integration (not used in this setup)
      neorg = {
        enabled = false,
      },
    },

    -- Maximum image dimensions in characters
    -- Keeps images readable without breaking layout
    max_width = 100,
    max_height = 12,
    -- Allow images to exceed window size if needed
    max_width_window_percentage = math.huge,
    max_height_window_percentage = math.huge,
    -- Clear images when windows overlap
    -- Prevents artifacts with popups and floating windows
    window_overlap_clear_enabled = true,
    -- Ignore clearing for specific floating window filetypes
    window_overlap_clear_ft_ignore = { 'cmp_menu', 'cmp_docs', 'snacks_notif', 'scrollview', 'scrollview_sign' },
  },
}
