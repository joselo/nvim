return {
  "fynnfluegge/monet.nvim",
  name = "monet",
  config = function()
    require("monet").setup {
      transparent_background = true,
      semantic_tokens = true,
      highlight_overrides= {},
      color_overrides = {},
      styles = {},
    }
  end
}
