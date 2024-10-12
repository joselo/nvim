local keymap = vim.keymap.set
local api = vim.api

keymap("n", "<C-t>", ":belowright split | terminal<cr>i")      -- starts in insert mode

api.nvim_command("autocmd TermOpen * setlocal nonumber")       -- no numbers
api.nvim_command("autocmd TermEnter * setlocal signcolumn=no") -- no sign column

local t_opts = {silent = true}

-- Terminal mode
keymap('t', '<esc>',     '<C-\\><C-N>', t_opts)
keymap('t', '<C-Left>',  '<C-\\><C-N><C-w>h', t_opts)
keymap('t', '<C-Down>',  '<C-\\><C-N><C-w>j', t_opts)
keymap('t', '<C-Up>',    '<C-\\><C-N><C-w>k', t_opts)
keymap('t', '<C-Right>', '<C-\\><C-N><C-w>l', t_opts)

-- Show only terminal not the pid
vim.o.statusline = "%{%v:lua.StatusLine()%}"
function _G.StatusLine()
  if vim.bo.buftype == 'terminal' then
    return ' [Terminal] '
  else
    return ' %f '
  end
end
