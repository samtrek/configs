-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local api = vim.api

api.nvim_create_autocmd(
  "FileType",
  { pattern = { "rmd", "r" }, command = [[inoremap <buffer> > <Esc>:normal! a %>%<CR>a]] }
)
-- go to last loc when opening a buffer
-- api.nvim_create_autocmd(
--   "BufReadPost",
--   { command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]] }
-- )

api.nvim_command("autocmd TermOpen * setlocal  norelativenumber")
api.nvim_command("autocmd TermOpen * setlocal  nonumber")
api.nvim_command("autocmd TermEnter * setlocal   signcolumn=no")
