local keymap = vim.keymap.set
local api = vim.api

keymap("n", "<C-t>", ":belowright split | terminal<cr>i")      -- starts in insert mode

api.nvim_command("autocmd TermOpen * setlocal nonumber")       -- no numbers
api.nvim_command("autocmd TermEnter * setlocal signcolumn=no") -- no sign column

local n_opts = {silent = true, noremap = true}
local t_opts = {silent = true}

-- Normal mode
-- Better window navigation
-- keymap('n', '<C-Left>',  '<C-w>h', n_opts)
-- keymap('n', '<C-Down>',  '<C-w>j', n_opts)
-- keymap('n', '<C-Up>',    '<C-w>k', n_opts)
-- keymap('n', '<C-Right>', '<C-w>l', n_opts)

-- Terminal mode
keymap('t', '<esc>',     '<C-\\><C-N>', t_opts)
keymap('t', '<C-Left>',  '<C-\\><C-N><C-w>h', t_opts)
keymap('t', '<C-Down>',  '<C-\\><C-N><C-w>j', t_opts)
keymap('t', '<C-Up>',    '<C-\\><C-N><C-w>k', t_opts)
keymap('t', '<C-Right>', '<C-\\><C-N><C-w>l', t_opts)
