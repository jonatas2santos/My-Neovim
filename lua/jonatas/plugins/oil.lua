return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    -- Use Oil as the default file explorer
    default_file_explorer = true,
    -- Columns displayed in the file list
    columns = {
      'icon',
      'permissions',
    },
    -- Move deleted files to trash instead of permanent delete
    delete_to_trash = true,
    -- Do not ask confirmation for simple file edits
    skip_confirm_for_simple_edits = true,
    -- Do not prompt to save when selecting another entry
    prompt_save_on_select_new_entry = false,

    view_options = {
      -- Show dotfiles ( important for configs and dotfiles )
      show_hidden = true,
    },

    keymaps = {
      ['g?'] = { 'actions.show_help', mode = 'n' },
      -- Navigation ( Vim-style )
      ['l'] = 'actions.select',
      ['h'] = { 'actions.parent', mode = 'n' },
      ['H'] = { 'actions.open_cwd', mode = 'n' },
      -- Open in splits / tabs
      ['<C-s>'] = { 'actions.select', opts = { vertical = true } },
      ['<C-h>'] = { 'actions.select', opts = { horizontal = true } },
      ['<C-t>'] = { 'actions.select', opts = { tab = true } },
      -- Preview and refresh
      ['<C-p>'] = 'actions.preview',
      ['<C-l>'] = 'actions.refresh',
      -- Close Oil
      ['<C-c>'] = { 'actions.close', mode = 'n' },
      -- Change directory
      ['`'] = { 'actions.cd', mode = 'n' },
      ['~'] = { 'actions.cd', opts = { scope = 'tab' }, mode = 'n' },
      -- Sorting and visibility
      ['gs'] = { 'actions.change_sort', mode = 'n' },
      ['g.'] = { 'actions.toggle_hidden', mode = 'n' },
      ['g\\'] = { 'actions.toggle_trash', mode = 'n' },
      -- Open file with external program
      ['gx'] = 'actions.open_external',
    },
  },
  dependencies = { { 'nvim-mini/mini.icons', opts = {} } },
  lazy = false,
}
