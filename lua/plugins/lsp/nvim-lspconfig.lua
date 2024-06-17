return {
  'neovim/nvim-lspconfig',
  cmd = {'LspInfo', 'LspInstall', 'LspStart'},
  event = {'BufReadPre', 'BufNewFile'},
  dependencies = {
    {'hrsh7th/cmp-nvim-lsp'},
    {'williamboman/mason-lspconfig.nvim'},
  },
  config = function()
    -- This is where all the LSP shenanigans will live
    local lsp_zero = require('lsp-zero')
    lsp_zero.extend_lspconfig()

    -- if you want to know more about mason.nvim
    -- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
    lsp_zero.on_attach(function(client, bufnr)
      -- see :help lsp-zero-keybindings
      -- to learn the available actions
      lsp_zero.default_keymaps({buffer = bufnr})
    end)

    require('mason-lspconfig').setup({
      ensure_installed = {
        "elixirls",
        "rust_analyzer",
        "lua_ls",
        "kotlin_language_server"
      },
      handlers = {
        -- this first function is the "default handler"
        -- it applies to every language server without a "custom handler"
        function(server_name)
          require('lspconfig')[server_name].setup({})
        end,

        -- this is the "custom handler" for `lua_ls`
        lua_ls = function()
          -- (Optional) Configure lua language server for neovim
          local lua_opts = lsp_zero.nvim_lua_ls()
          require('lspconfig').lua_ls.setup(lua_opts)
        end,
      }
    })

    local lspconfig = require("lspconfig")

    -- Rust
    lspconfig.rust_analyzer.setup({
      checkOnSave = { command = "clippy" }
    })

    -- ElixirLS
    lspconfig.elixirls.setup({
      flags = {
        debounce_text_changes = 150,
      },
      elixirLS = {
        dialyzerEnabled = false,
        fetchDeps = false,
      }
    })

    -- Kotlin
    lspconfig.kotlin_language_server.setup({
      filetypes = { "kotlin" },
      kotlin = {
        -- formatters = {
        --   ignoreComments = true,
        -- },
        signatureHelp = { enabled = true }
      },
      workspace = { checkThirdParty = false },
      telemetry = { enabled = false }
    })
  end
}
