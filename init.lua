local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("custom")
require("lazy").setup({{import = "plugins"}, {import = "plugins.themes"}, {import = "plugins.lsp"}})
-- require("lazy").setup({{import = "plugins"}, {import = "plugins.themes"}})

-- Theme
vim.opt.termguicolors = true
-- vim.cmd.colorscheme 'melange'
-- vim.cmd.colorscheme 'monet'

-- vim.cmd("colorscheme rose-pine")
-- vim.cmd("colorscheme rose-pine-main")
-- vim.cmd("colorscheme rose-pine-moon")
-- vim.cmd("colorscheme rose-pine-dawn")

-- vim.cmd('colorscheme github_dark')
-- vim.cmd('colorscheme github_dark_default')
-- vim.cmd('colorscheme github_light_default')
-- vim.cmd('colorscheme github_light')

-- vim.cmd.colorscheme 'gruvbox'

-- vim.cmd.colorscheme 'miasma'

-- vim.cmd("colorscheme nightfox")
-- vim.cmd.colorscheme 'terafox'
-- vim.cmd.colorscheme 'duskfox'
