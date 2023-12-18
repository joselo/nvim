return {
  "neovim/nvim-lspconfig",
  config = function()
    local lexical_config = {
      filetypes = { "elixir", "eelixir", "heex", "surface" },
      cmd = { "/home/joselo/.lexical/_build/dev/package/lexical/bin/start_lexical.sh" },
      settings = {},
    }

    local custom_attach = function(client)
      print("Lexical has started.")
    end

		local lspconfig = require("lspconfig")
		local configs = require("lspconfig.configs")

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

		lspconfig.lexical.setup({
			-- optional config
			on_attach = custom_attach,
		})

    -- keymap
    local keymap = vim.api.nvim_set_keymap

    local opts = { noremap = true, silent = true }

    keymap("", "<Space>", "<Nop>", opts)
    keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
    keymap("n", "<leader>li", "<cmd>LspInfo<cr>", opts)

    ----------------------------------------

    -- Global mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>f', function()
          vim.lsp.buf.format { async = true }
        end, opts)
      end,
    })
  end
}
