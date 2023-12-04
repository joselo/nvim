function loadTheme(color, dark)
	color = color or "gruvbox"

	vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.opt.termguicolors = true

  -- This is commented because I want to have a transparent background

  if dark then
    vim.o.background = "dark"
  else
    vim.o.background = "light"
  end
end

loadTheme("melange", true)
