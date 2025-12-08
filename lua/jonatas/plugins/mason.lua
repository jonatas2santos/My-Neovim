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
    "neovim/nvim-lspconfig",
    config = function()
      -- Lua ls
      vim.lsp.config("lua_ls", {
        cmd = { "/usr/sbin/lua-language-server" },
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
              workspace = { checkThirdParty = false },
            },
          },
        },
      })

      -- Python PyLSP
      vim.lsp.config("pylsp", {
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = { maxLineLength = 88 },
              pylint = { enabled = false },
            },
          },
        },
      })

      -- Ruff (LSP standalone)
      vim.lsp.config("ruff", {
        settings = {},
      })
    end,
  },
}
