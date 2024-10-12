local keymap = vim.keymap.set

-- Leader key
vim.keymap.set("n", " ", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

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

-- Quick navigation between buffers
-- Map Ctrl+Tab to switch to the next buffer
-- vim.api.nvim_set_keymap('n', '<C-Tab>', ':bnext<CR>', { noremap = true, silent = true })

-- Map Ctrl+Shift+Tab to switch to the previous buffer
-- vim.api.nvim_set_keymap('n', '<C-S-Tab>', ':bprevious<CR>', { noremap = true, silent = true })

-- Toggle between the last two buffer opened
vim.api.nvim_set_keymap('n', '<C-Tab>', ':b#<CR>', { noremap = true, silent = true })



-- Copy the file paths to the clipboard
vim.api.nvim_create_user_command("Cppath", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})
