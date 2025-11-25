return {
  -- mason
  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        },
      },
    }
  },

  -- mason-lsp
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "ruff",
        "pylsp"
      },
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },

  -- lsp configs
  {
    vim.lsp.config('lua_ls', {
      settings = {
        ['Lua'] = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })
  }
}
