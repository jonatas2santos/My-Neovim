return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = false },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    { "<leader>lg", function() Snacks.lazygit() end,                                        desc = "Lazygit" },
    { "<leader>gl", function() Snacks.picker.lazygit_log() end,                             desc = "Git Log" },
    { "<leader>rn", function() Snacks.rename.rename_file() end,                             desc = "Rename File" },
    { "<leader>ff", function() Snacks.picker.files() end,                                   desc = "Find Files" },
    { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    { "<leader>sg", function() Snacks.picker.grep() end,                                    desc = "Grep" },
    { "<leader>sw", function() Snacks.picker.grep_word() end,                               desc = "Visual selection or word", mode = { "n", "x" } },
    { "<leader>sk", function() Snacks.picker.keymaps() end,                                 desc = "Keymaps" },
    { "<leader>gb", function() Snacks.picker.git_branches() end,                            desc = "Git Branches" },
    { "<leader>fh", function() Snacks.picker.help() end,                                    desc = "Help Pages" },
    { "<leader>si", function() Snacks.picker.icons() end,                                   desc = "Icons" },
    { "<leader>bb", function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
    { "<leader>bd", function() Snacks.bufdelete() end,                                      desc = "Delete Buffer" },
    { "<leader>/",  function() Snacks.terminal() end,                                       desc = "Toggle Terminal" },
  },
}
