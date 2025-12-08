return {
  "quarto-dev/quarto-nvim",
  dependencies = {
    "jmbuhr/otter.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    keymap = {
      hover = "qh",
      definition = "qd",
      rename = "<Leader>qr",
      references = "qr",
      format = "qf",
    },
    debug = false,
    closePreviewOnExit = true,
    lspFeatures = {
      enabled = true,
      chunks = "all",
      languages = { "r", "python", "julia", "bash", "html", "rust" },
      diagnostics = {
        enabled = true,
        triggers = { "BufWritePost" },
      },
      completion = {
        enabled = true,
      },
    },
    codeRunner = {
      enabled = true,
      default_method = "molten", -- "molten", "slime", "iron" or <function>
      ft_runners = {}, -- filetype to runner, ie. `{ python = "molten" }`.
      -- Takes precedence over `default_method`
      never_run = { 'yaml' }, -- filetypes which are never sent to a code runner
    },
  },
}
