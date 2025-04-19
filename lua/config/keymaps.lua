vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- exit insert mode
vim.keymap.set('i', 'jj', '<Esc>')

vim.keymap.set('n', '<Leader>pv', ':Ex<CR>', {})

-- exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', {})

-- move windows
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', {})
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', {})
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', {})
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', {})

-- buffer keybinds
vim.keymap.set('n', '<S-h>', ':bprevious<CR>', {})
vim.keymap.set('n', '<S-l>', ':bnext<CR>', {})
vim.keymap.set('n', '<Leader>bc', ':bdelete<CR>', {})

-- window keybinds
vim.keymap.set('n', '<Leader>vs', ':vsplit<CR>', {})

-- tab keybinds
vim.keymap.set('n', '<Leader>tb', ':tabnew %<CR>', {})
vim.keymap.set('n', '<Leader>tc', ':tabclose<CR>', {})
vim.keymap.set('n', '<Leader>tl', ':tabnext<CR>', {})
vim.keymap.set('n', '<Leader>th', ':tabprevious<CR>', {})

-- lsp keybinds
vim.keymap.set('n', '<leader>dh', vim.lsp.buf.hover, {})
vim.keymap.set('n', '<leader>df', vim.lsp.buf.definition, {})
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>di", vim.diagnostic.open_float, {})
