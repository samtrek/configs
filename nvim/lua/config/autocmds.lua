-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_command("autocmd TermOpen * setlocal  norelativenumber")
vim.api.nvim_command("autocmd TermOpen * setlocal  nonumber")
vim.api.nvim_command("autocmd TermEnter * setlocal   signcolumn=no")

vim.api.nvim_create_autocmd(
  "FileType",
  { pattern = { "rmd", "r" }, command = [[inoremap <buffer> > <Esc>:normal! a %>%<CR>a]] }
)

vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("heiglight_zotcite"),
  pattern = { "text", "markdown" },
  callback = function()
    vim.cmd("source /home/samtrek/.local/share/nvim/lazy/zotcite/after/syntax/markdown.vim")
  end,
})
