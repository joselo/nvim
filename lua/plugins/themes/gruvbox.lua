return {
  "ellisonleao/gruvbox.nvim",
  config = function ()
    require("gruvbox").setup({
      overrides = {
        SignColumn = {bg = "#282828"}
      }
    })
  end
}
