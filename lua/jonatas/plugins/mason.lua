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

      -- Python PyLSP ( autocomplete, hover, imports, renames )
      vim.lsp.config("pylsp", {
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = { enabled = false },
              mccabe = { enabled = false },
              pyflakes = { enabled = false },
              yapf = { enabled = false },
              autopep8 = { enabled = false },
              pylint = { enabled = false },
            },
          },
        },
      })

      -- Ruff + Ruff Formatter
      vim.lsp.config("ruff", {
        settings = {},
      })
    end,
  },
}
