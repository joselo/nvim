return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    {'L3MON4D3/LuaSnip'},
  },
  config = function()
    -- Here is where you configure the autocompletion settings.
    local lsp_zero = require('lsp-zero')
    lsp_zero.extend_cmp()

    -- And you can configure cmp even more, if you want to.
    local cmp = require('cmp')
    local cmp_action = lsp_zero.cmp_action()

    cmp.setup({
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
          -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
          -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
        end,
      },
      window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
      }, {
          { name = 'buffer' },
        })

      -- formatting = lsp_zero.cmp_format({details = true}),
      -- mapping = cmp.mapping.preset.insert({
      --   ['<C-Space>'] = cmp.mapping.complete(),
      --   ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      --   ['<C-d>'] = cmp.mapping.scroll_docs(4),
      --   ['<C-f>'] = cmp_action.luasnip_jump_forward(),
      --   ['<C-b>'] = cmp_action.luasnip_jump_backward(),
      -- }),
      -- snippet = {
      --   expand = function(args)
      --     require('luasnip').lsp_expand(args.body)
      --   end,
      -- },
    })
  end
}
