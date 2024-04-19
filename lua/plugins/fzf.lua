return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local fzf = require("fzf-lua")
    local keymap = vim.keymap.set

    fzf.setup({
      hls = { border = "FloatBorder" },

      -- Previewers
      preview_opts = 'hidden',
      previewers = {
        builtin = {
          scrollchar = '│',
        },
      },

      -- Commands
      buffers = { prompt = 'Buffers: ', ignore_current_buffer = true, sort_lastused = true },
    })

    keymap(
      "n",
      "<C-p>",
      function()
        fzf.files()
      end,
      {silent = true}
    )

    keymap(
      "n",
      "<C-b>",
      function()
        fzf.buffers()
      end,
      {silent = true}
    )

    keymap(
      "n",
      "<C-f>",
      function()
        fzf.lgrep_curbuf()
      end,
      {silent = true}
    )

    keymap(
      "n",
      "<C-g>",
      function()
        fzf.live_grep()
      end,
      {silent = true}
    )
  end
}
