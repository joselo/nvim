local keymap = vim.keymap.set

-- Leader key
vim.keymap.set("n", " ", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Open path in a buffer
keymap("n", "<C-W><C-S-F>", "<C-W>vgF")

-- Quick search
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {desc = 'Quick search and replace' })

-- Tab/Shift+tab to indent/dedent
keymap("v", "<Tab>", ">gv")
keymap("v", "<S-Tab>", "<gv")

-- Tabs navigation
keymap("n", "<C-Left>", vim.cmd.tabprevious)
keymap("n", "<C-Right>", vim.cmd.tabnext)
keymap("n", "<C-\\>", vim.cmd.tabnew)

-- yank to clipboard
keymap({"n", "v"}, "<leader>y", [["+y]])

-- buffers
keymap("n", "<leader>n", ":bn<cr>")
keymap("n", "<leader>p", ":bp<cr>")
keymap("n", "<leader>x", ":BufDel<cr>")
