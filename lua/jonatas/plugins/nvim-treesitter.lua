return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
      local treesitter = require("nvim-treesitter.configs")
      treesitter.setup({
        highlight = {
          enable = true,
        },
        indent = { enable = true },
        ensure_installed = {
          "c",
          "lua",
          "vim",
          "vimdoc",
          "query",
          "markdown",
          "markdown_inline",
          "python",
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>", -- set to `false` to disable one of the mappings
            node_incremental = "<C-space>",
            scope_incremental = "false",
          },
        },
        additional_vim_regex_highlighting = false,
      })
    end
  }
}
