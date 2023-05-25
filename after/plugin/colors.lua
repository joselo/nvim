function loadTheme(color, bg)
	color = color or "gruvbox"

	vim.cmd.colorscheme(color)

  if bg then
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end

  -- vim.o.background = "dark"
end

-- loadTheme()
-- loadTheme("tokyonight-night")

loadTheme("terafox", true)
-- loadTheme("dayfox", false)
