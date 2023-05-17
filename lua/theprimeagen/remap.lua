local keymap = vim.keymap.set

vim.g.mapleader = ","

-- Move block of code

keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

-- Remove lines below
keymap("n", "J", "mzJ`z")

-- Navigate and keep the cursor in the center
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

-- Quick search
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Open path in a buffer
keymap("n", "<C-W><C-S-F>", "<C-W>vgF")

-- Terminal

keymap("n", "<C-t>", vim.cmd.term)

local n_opts = {silent = true, noremap = true}
local t_opts = {silent = true}

-- Normal mode
-- Better window navigation
keymap('n', '<C-Left>',  '<C-w>h', n_opts)
keymap('n', '<C-Down>',  '<C-w>j', n_opts)
keymap('n', '<C-Up>',    '<C-w>k', n_opts)
keymap('n', '<C-Right>', '<C-w>l', n_opts)

-- Terminal mode
keymap('t', '<esc>',     '<C-\\><C-N>', t_opts)
keymap('t', '<C-Left>',  '<C-\\><C-N><C-w>h', t_opts)
keymap('t', '<C-Down>',  '<C-\\><C-N><C-w>j', t_opts)
keymap('t', '<C-Up>',    '<C-\\><C-N><C-w>k', t_opts)
keymap('t', '<C-Right>', '<C-\\><C-N><C-w>l', t_opts)

-- vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
