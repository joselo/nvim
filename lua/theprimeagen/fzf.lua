vim.keymap.set("n", "<C-p>",
  "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })

vim.keymap.set("n", "<C-b>",
  "<cmd>lua require('fzf-lua').buffers()<CR>", { silent = true })

vim.keymap.set("n", "<C-g>",
  "<cmd>lua require('fzf-lua').grep()<CR>", { silent = true })

vim.keymap.set("n", "<C-f>",
  "<cmd>lua require('fzf-lua').blines()<CR>", { silent = true })

vim.keymap.set("n", "<C-y>",
  "<cmd>lua require('fzf-lua').tabs()<CR>", { silent = true })
