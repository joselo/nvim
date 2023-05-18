vim.keymap.set("n", "<C-x>", vim.cmd.NeoTreeFocusToggle)

require('neo-tree').setup {
  filesystem = {
    filtered_items = {
      visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
      hide_dotfiles = false,
      hide_gitignored = true
    }
  }
}

