vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- exit insert mode
vim.keymap.set('i', 'jj', '<Esc>')

-- exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- move windows
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Window, move down' })
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Window, move left' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Window, move up' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Window, move right' })

-- buffer keybinds
vim.keymap.set('n', '<S-h>', ':bprevious<CR>', { desc = 'Buffer, prev' })
vim.keymap.set('n', '<S-l>', ':bnext<CR>', { desc = 'Buffer, next' })
vim.keymap.set('n', '<Leader>bl', ':bdelete<CR>', { desc = 'Buffer, delete' })

-- split keybinds
vim.keymap.set('n', '<Leader>vs', ':vsplit<CR>', { desc = 'Split, vertical' })

-- tab keybinds
vim.keymap.set('n', '<Leader>tn', ':tabnew %<CR>', { desc = 'Tab, open new' })
vim.keymap.set('n', '<Leader>tl', ':tabclose<CR>', { desc = 'Tab, close' })
vim.keymap.set('n', '<A-l>', ':tabnext<CR>', { desc = 'Tab, next' })
vim.keymap.set('n', '<A-h>', ':tabprevious<CR>', { desc = 'Tab, prev' })

-- source
vim.keymap.set('n', '<space><space>x', ':source<CR>', { desc = 'Source file' })

-- remaps
vim.cmd.nnoremap('<C-d>', '<C-d>zz')
vim.cmd.nnoremap('<C-u>', '<C-u>zz')
vim.cmd.nnoremap('n', 'nzz')
vim.cmd.nnoremap('N', 'Nzz')

-- lsp keybinds
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Lsp code actions' })
vim.keymap.set('n', '<leader>di', vim.diagnostic.open_float, { desc = 'lsp diagonostic menu' })
vim.keymap.set('n', '<leader>lm', function() vim.lsp.buf.format() end, { desc = 'Lsp format current buffer' })

-- neotest
vim.keymap.set("n", "<leader>tn", function() require("neotest").run.run() end, { desc = "Neotest, run nearest test" })
vim.keymap.set("n", "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end,
  { desc = "Neotest, run current buffer" })
vim.keymap.set("n", "<leader>ts", function() require("neotest").output.open({ enter = true }) end,
  { desc = "Neotest, open test window" })

-- word wrap
vim.keymap.set('n', '<Leader>ww', function()
  vim.opt.wrap = not vim.opt.wrap:get()
end, { desc = 'toggle word wrap' })
