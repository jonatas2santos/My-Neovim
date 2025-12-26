return {
  -- Mason: external tool manager ( LSPs, formatters, linters )
  {
    'mason-org/mason.nvim',
    opts = {
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    },
  },

  -- Mason ↔ LSP bridge
  {
    'mason-org/mason-lspconfig.nvim',
    dependencies = {
      'mason-org/mason.nvim',
      'neovim/nvim-lspconfig',
    },
    opts = {
      -- Automatically install required language servers
      ensure_installed = {
        'lua_ls',
        'ruff',
      },
    },
  },

  -- LSP server configuration
  {
    'neovim/nvim-lspconfig',
    config = function()
      -- Lua language server ( Neovim config files )
      vim.lsp.config( 'lua_ls', {
        -- cmd = { "/usr/sbin/lua-language-server" },
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
              workspace = { checkThirdParty = false },
            },
            -- Disable LSP formatting (handled by Conform/Stylua)
            format = {
              enable = false,
            },
          },
        },
      })

      -- Ruff LSP ( linting, diagnostics, code actions for Python )
      vim.lsp.config('ruff', {
        settings = {
          -- Keep minimal, Ruff is already configured via pyproject.toml
        },
      })
    end,
  },
}
