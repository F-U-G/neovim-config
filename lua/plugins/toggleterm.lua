return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {--[[ things you want to change go here]]},
  config = function()
    require("toggleterm").setup()
    vim.keymap.set("n", "<Leader>tt", ":ToggleTerm<CR>")
  end,
}
