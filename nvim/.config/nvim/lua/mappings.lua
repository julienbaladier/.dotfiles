vim.api.nvim_set_keymap(
  'n', '<Leader>R', ':source $MYVIMRC<CR>', 
  { noremap = true }
)

vim.api.nvim_set_keymap(
  'n', '<C-n>', ':NvimTreeToggle<CR>',
  { noremap = true }
)
vim.api.nvim_set_keymap(
  'n', '<Leader>r', ':NvimTreeRefresh<CR>',
  { noremap = true }
)
vim.api.nvim_set_keymap(
  'n', '<Leader>n', ':NvimTreeFindFile<CR>',
  { noremap = true }
)

vim.api.nvim_set_keymap(
  'n', '<Leader>ff', '<cmd>Telescope find_files<CR>',
  { noremap = true }
)
vim.api.nvim_set_keymap(
  'n', '<Leader>fg', '<cmd>Telescope live_grep<CR>',
  { noremap = true }
)
vim.api.nvim_set_keymap(
  'n', '<Leader>fb', '<cmd>Telescope buffers<CR>',
  { noremap = true }
)
vim.api.nvim_set_keymap(
  'n', '<Leader>fh', '<cmd>Telescope help_tags<CR>',
  { noremap = true }
)

vim.api.nvim_set_keymap(
  'n', '<Leader>p', ':Glow %<CR><C-w>|<C-w>_',
  { noremap = true }
)

