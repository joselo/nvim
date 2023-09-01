function loadTheme(color, light)
	color = color or "gruvbox"

	vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.opt.termguicolors = true

  if light then
    vim.o.background = "light"
  end
end

-- loadTheme("terafox", true)
-- loadTheme("dayfox", false)

loadTheme("melange", true)
