vim.g.mapleader = ","

-- Move block of code

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Remove lines below
vim.keymap.set("n", "J", "mzJ`z")

-- Navigate and keep the cursor in the center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Quick search
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Open path in a buffer
vim.keymap.set("n", "<C-W><C-S-F>", "<C-W>vgF")
