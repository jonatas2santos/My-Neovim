return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- Performance and large file handling
    bigfile = { enabled = true },
    quickfile = { enabled = true },
    -- UI and UX helpers
    notifier = { enabled = true },
    input = { enabled = true },
    indent = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    scope = { enabled = true },
    -- Picker ( acts as Telescope replacement )
    picker = { enabled = true },
    -- Explicitly disabled features
    dashboard = { enabled = true },
    explorer = { enabled = false },
    words = { enabled = false },
  },
  keys = {
    -- Git
    { '<leader>lg', function() Snacks.lazygit() end,                                        desc = 'lazygit' },
    { '<leader>gl', function() Snacks.picker.lazygit_log() end,                             desc = 'git log' },
    { '<leader>gb', function() Snacks.picker.git_branches() end,                            desc = 'git branches' },
    -- Files
    { '<leader>ff', function() Snacks.picker.files() end,                                   desc = 'find files' },
    { '<leader>fc', function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = 'find config file' },
    -- Search
    { '<leader>sg', function() Snacks.picker.grep() end,                                    desc = 'grep' },
    { '<leader>sw', function() Snacks.picker.grep_word() end,                               desc = 'visual selection or word', mode = { 'n', 'x' } },
    { '<leader>sk', function() Snacks.picker.keymaps() end,                                 desc = 'keymaps' },
    -- Help
    { '<leader>fh', function() Snacks.picker.help() end,                                    desc = 'help pages' },
    { '<leader>si', function() Snacks.picker.icons() end,                                   desc = 'icons' },
    -- Buffers
    { '<leader>bb', function() Snacks.picker.buffers() end,                                 desc = 'buffers' },
    { '<leader>bd', function() Snacks.bufdelete() end,                                      desc = 'delete buffer' },
    -- Filesystem
    { '<leader>rn', function() Snacks.rename.rename_file() end,                             desc = 'rename file' },
    -- Terminal
    { '<leader>/',  function() Snacks.terminal() end,                                       desc = 'toggle terminal' },
  },
}
