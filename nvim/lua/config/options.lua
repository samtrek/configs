-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.maplocalleader = ","
-- vim.g["R_csv_app"] = "tmux new-window sc-im"
vim.g["zotcite_open_in_zotero"] = 1
-- vim.g["R_external_term"] = "kitty -1 --class rterm -T rterm -o initial_window_width=65c -o initial_window_height=17c -e"
vim.g["iron_python_cmd"] = "ptpython"
vim.g["rout_follow_colorscheme"] = 1
vim.g["zotcite_filetypes"] = { "markdown", "pandoc", "rmd", "norg" }
vim.opt.spelllang = "en_us,tr"
vim.wo.linebreak = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
