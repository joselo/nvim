local neotest = require("neotest")

neotest.setup({
  adapters = {
    require("neotest-elixir"),
  },

})

vim.keymap.set(
  "n",
  "<leader>t",
  function()
    neotest.run.run()
  end,
  {desc = 'Run the nearest test'}
)

vim.keymap.set(
  "n",
  "<leader>tf",
  function()
    neotest.run.run(vim.fn.expand("%"))
  end,
  {desc = 'Run the current file test'}
)
