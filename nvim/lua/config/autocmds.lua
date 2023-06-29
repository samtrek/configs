-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_command("autocmd TermOpen * setlocal  norelativenumber")
vim.api.nvim_command("autocmd TermOpen * setlocal  nonumber")
vim.api.nvim_command("autocmd TermEnter * setlocal   signcolumn=no")
vim.api.nvim_create_autocmd(
  "FileType",
  { pattern = { "rmd", "r" }, command = [[inoremap <buffer> > <Esc>:normal! a %>%<CR>a]] }
)
