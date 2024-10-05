return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "truncate " },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<C-b>", "<cmd>Telescope buffers<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<C-g>", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<C-f>", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Find string in the current buffer" })

    --  shows the files that have changed from main/master
    function _G.git_diff(opts)
      local pickers = require "telescope.pickers"
      local finders = require "telescope.finders"
      local conf = require("telescope.config").values
      local list = vim.fn.systemlist('git diff --name-only')

      pickers.new(opts, {
        prompt_title = "git diff",
        finder = finders.new_table { results = list },
        sorter = conf.generic_sorter(opts)
      }):find()
    end

    keymap.set("n", "<leader>gd", ":lua _G.git_diff()<CR>")
  end,
}
