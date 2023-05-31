vim.keymap.set("n", "<C-p>",
  "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })

vim.keymap.set("n", "<C-b>",
  "<cmd>lua require('fzf-lua').buffers()<CR>", { silent = true })

vim.keymap.set("n", "<C-g>",
  "<cmd>lua require('fzf-lua').grep_project()<CR>", { silent = true })

vim.keymap.set("n", "<C-f>",
  "<cmd>lua require('fzf-lua').blines()<CR>", { silent = true })

vim.keymap.set("n", "<C-y>",
  "<cmd>lua require('fzf-lua').tabs()<CR>", { silent = true })

-- Image Preview

local img_previewer = { "viu" }

require("fzf-lua").setup({
  winopts = {
    -- hl = { border = "FloatBorder", }
  },

  previewers = {
    builtin = {
      ueberzug_scaler = "cover",
      extensions = {
        ["gif"] = img_previewer,
        ["png"] = img_previewer,
        ["jpg"] = img_previewer,
        ["jpeg"] = img_previewer,
      }
    }
  }
})
