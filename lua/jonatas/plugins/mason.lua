return {
  -- Mason: external tool manager
  {
    'mason-org/mason.nvim',
    opts = {
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗'
        },
      },
    },
  },

  -- Mason LSP bridge
  {
    'mason-org/mason-lspconfig.nvim',
    dependencies = {
      'mason-org/mason.nvim',
      'neovim/nvim-lspconfig',
    },
    opts = {
      ensure_installed = {
        'lua_ls',
        'ruff',
      },
    },
  },

  -- LSP configurations
  {
    'neovim/nvim-lspconfig',
    config = function()
      -- Lua language server ( Neovim config )
      vim.lsp.config('lua_ls', {
        -- cmd = { "/usr/sbin/lua-language-server" },
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
              workspace = { checkThirdParty = false },
            },
          },
        },
      })

      -- Ruff LSP ( liting, diagnostics, code actions )
      vim.lsp.config('ruff', {
        settings = {},
      })
    end,
  },
}
