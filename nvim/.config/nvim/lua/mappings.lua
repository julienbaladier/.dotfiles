local noremap = require("utils").noremap

noremap('n', '<Leader><CR>', ':source $MYVIMRC<CR>')

noremap('n', '<C-n>', ':NvimTreeToggle<CR>')
noremap('n', '<Leader>r', ':NvimTreeRefresh<CR>')
noremap('n', '<Leader>n', ':NvimTreeFindFile<CR>')

noremap('n', '<Leader>ff', '<cmd>Telescope find_files<CR>')
noremap('n', '<Leader>fg', '<cmd>Telescope live_grep<CR>')
noremap('n', '<Leader>fb', '<cmd>Telescope buffers<CR>')
noremap('n', '<Leader>fh', '<cmd>Telescope help_tags<CR>')

noremap('n', '<Leader>p', ':Glow %<CR><C-w>|<C-w>_')

noremap('n', 'n', 'nzzzv')
noremap('n', 'N', 'Nzzzv')

noremap('x', '<leader>p', '"_dP')

noremap('n', '<leader>d', '"_d')
noremap('v', '<leader>d', '"_d')
noremap('n', '<leader>D', '"_D')
noremap('v', '<leader>D', '"_D')

-- remap splits navigation
noremap ('n', '<C-h>', '<C-w>h')
noremap ('n', '<C-j>', '<C-w>j')
noremap ('n', '<C-k>', '<C-w>k')
noremap ('n', '<C-l>', '<C-w>l')

