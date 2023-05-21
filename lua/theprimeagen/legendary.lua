require('legendary').setup({
  keymaps = {
    -- { '<leader>ff', ': find_files', description = 'Find files' },
  },
  commands = {
    { ':FzfLua', description = 'Fzf Lua', filters = { ft = 'find' } },
  },
  funcs = {
  },
  autocmds = {
  },
  extensions = {
  }
})
