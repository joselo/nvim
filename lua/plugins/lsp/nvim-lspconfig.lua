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
        "lexical",
        "rust_analyzer"
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
    local configs = require("lspconfig.configs")

    -- Lexical
    local lexical_config = {
      filetypes = { "elixir", "eelixir", "heex" },
      cmd = { "/home/joselo/.lexical/bin/start_lexical.sh" },
      settings = {},
    }

    if not configs.lexical then
      configs.lexical = {
        default_config = {
          filetypes = lexical_config.filetypes,
          cmd = lexical_config.cmd,
          root_dir = function(fname)
            return lspconfig.util.root_pattern("mix.exs", ".git")(fname) or vim.loop.os_homedir()
          end,
          -- optional settings
          settings = lexical_config.settings,
        },
      }
    end

    lspconfig.lexical.setup({})

    -- Rust
    lspconfig.rust_analyzer.setup({
      checkOnSave = { command = "clippy" }
    })
  end
}
