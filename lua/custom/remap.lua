local keymap = vim.keymap.set

vim.keymap.set("n", " ", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "

-- Move block of code

keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

-- Remove lines below
keymap("n", "J", "mzJ`z")

-- Navigate and keep the cursor in the center
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

-- Quick search
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {desc = 'Quick search' })

-- Open path in a buffer
keymap("n", "<C-W><C-S-F>", "<C-W>vgF")

-- Tab/Shift+tab to indent/dedent
keymap("v", "<Tab>", ">gv")
keymap("v", "<S-Tab>", "<gv")

-- Tabs navigation
keymap("n", "<C-Left>", vim.cmd.tabprevious)
keymap("n", "<C-Right>", vim.cmd.tabnext)
keymap("n", "<C-T>", vim.cmd.tabnew)

-- Edit files in the same buffer directory
-- keymap("c", "e.", "edit <C-r>=expand("%:h")<cr>/")

-- cnoremap e. edit <c-r>=expand("%:h")<cr>/
