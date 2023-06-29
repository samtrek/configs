-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g["R_auto_start"] = 2
vim.g["R_cmd"] = "R"
vim.g["R_rconsole_width"] = 50
vim.g["R_min_editor_width"] = 18
vim.g["R_hl_term"] = 1
--vim.g["R_app"] = "radian"
vim.g["R_bracketed_paste"] = 1
vim.g["rout_follow_colorscheme"] = 1
vim.g["zotcite_filetypes"] = "markdown,pandoc, rmd, text"
vim.opt.spelllang = "en,tr"
vim.g["R_args"] = { "--no-save", "--quiet", "--no-restore", "--no-site-file" }
vim.g["Rout_prompt_str"] = "»"
vim.g["R_start_libs"] = "base,stats,graphics,grDevices,utils,methods,pacman"
