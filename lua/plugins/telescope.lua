-- return {
--   "nvim-telescope/telescope.nvim",
--   branch = "0.1.x",
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--     { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
--     "nvim-tree/nvim-web-devicons",
--   },
--   config = function()
--     local telescope = require("telescope")
--     local actions = require("telescope.actions")
--
--     telescope.setup({
--       defaults = {
--         path_display = { "truncate " },
--         mappings = {
--           i = {
--             ["<C-k>"] = actions.move_selection_previous, -- move to prev result
--             ["<C-j>"] = actions.move_selection_next, -- move to next result
--             ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
--           },
--         },
--       },
--     })
--
--     telescope.load_extension("fzf")
--
--     -- set keymaps
--     local keymap = vim.keymap -- for conciseness
--
--     keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
--     keymap.set("n", "<C-b>", "<cmd>Telescope buffers<cr>", { desc = "Fuzzy find recent files" })
--     keymap.set("n", "<C-g>", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
--     keymap.set("n", "<C-f>", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Find string in the current buffer" })
--   end,
-- }

return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local fzf = require("fzf-lua")
    local keymap = vim.keymap.set

    fzf.setup({
      hls = { border = "FloatBorder" }
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
