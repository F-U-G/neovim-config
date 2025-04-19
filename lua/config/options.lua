-- clipboard
vim.opt.clipboard = 'unnamedplus'

-- tabs
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.shiftwidth = 2

vim.opt.scrolloff = 10
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wrap = false

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.inccommand = "split"

vim.opt.ignorecase = true

vim.opt.termguicolors = true

vim.opt.virtualedit = "block"

-- obsidian.nvim, conceal syntax
-- vim.opt.coceallevel = 2

-- turn of comment continuation
vim.cmd "autocmd Bufenter * set formatoptions-=cro"
vim.cmd "autocmd Bufenter * setlocal formatoptions-=cro"

vim.g.have_nerd_font = true

-- yank highlight
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- borders for hover menus
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = "rounded" }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { border = "rounded" }
)

vim.diagnostic.config({
  float = { border = "rounded" }
})
