return {
  "neovim/nvim-lspconfig",
  config = function()
    -- generic LSP settings
    --
    -- ---@usage disable automatic installation of servers
    -- lvim.lsp.automatic_servers_installation = false
    local lspconfig = require("lspconfig")

    -- Neovim doesn't support snippets out of the box, so we need to mutate the
    -- capabilities we send to the language server to let them know we want snippets.
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true


    -- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
    -- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
    -- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
    -- local opts = {} -- check the lspconfig documentation for a list of all possible options
    -- require("lvim.lsp.manager").setup("pyright", opts)
    -- Elixir LS
    lspconfig.elixirls.setup {
      cmd = { "/home/joselo/.elixir-ls/language_server.sh" },
      -- on_attach = custom_attach, -- this may be required for extended functionalities of the LSP
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 150,
      },
      elixirLS = {
        dialyzerEnabled = false,
        fetchDeps = false,
      };
    }
  end
}
