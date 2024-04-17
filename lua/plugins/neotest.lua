return { 
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "jfpedroza/neotest-elixir",
    "nvim-neotest/nvim-nio"
  },
  config = function()
    local neotest = require("neotest")
    local keymap = vim.keymap.set

    neotest.setup({
      adapters = {
        require("neotest-elixir"),
      },
    })

    keymap(
      "n",
      "<leader>t",
      function()
        neotest.run.run()
      end,
      {desc = 'Run the nearest test'}
    )

    keymap(
      "n",
      "<leader>tf",
      function()
        neotest.run.run(vim.fn.expand("%"))
      end,
      {desc = 'Run the current file test'}
    )
  end
}
