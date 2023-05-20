local keymap = vim.keymap.set
local genghis = require("genghis")

keymap("n", "<leader>yp", genghis.copyFilepath, {desc = 'Copy file path'})
keymap("n", "<leader>yn", genghis.copyFilename, {desc = 'Copy file name'})
keymap("n", "<leader>cx", genghis.chmodx, {desc = 'Chmodx'})
keymap("n", "<leader>rf", genghis.renameFile, {desc = 'Rename file'})
keymap("n", "<leader>mf", genghis.moveAndRenameFile, {desc = 'Move and remove a file'})
keymap("n", "<leader>nf", genghis.createNewFile, {desc = 'Create new file'})
keymap("n", "<leader>yf", genghis.duplicateFile, {desc = 'Duplicate file'})
keymap("n", "<leader>df", genghis.trashFile, {desc = 'Trash file'})
keymap("x", "<leader>x", genghis.moveSelectionToNewFile, {desc = 'Move selection to next file'})
