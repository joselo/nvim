vim.api.nvim_create_autocmd('BufWritePre', {
  group = vim.api.nvim_create_augroup('auto_create_dir', { clear = true }),
  command = [[call mkdir(expand('<afile>:p:h'), 'p')]],
})
