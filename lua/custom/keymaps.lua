local keymap = vim.keymap.set

-- Leader key
vim.keymap.set("n", " ", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "

-- Open path in a buffer
keymap("n", "<C-W><C-S-F>", "<C-W>vgF")

-- Quick search
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {desc = 'Quick search and replace' })

-- Tab/Shift+tab to indent/dedent
keymap("v", "<Tab>", ">gv")
keymap("v", "<S-Tab>", "<gv")
