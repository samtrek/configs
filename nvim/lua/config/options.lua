-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.maplocalleader = ","
vim.g["R_auto_start"] = 2
-- vim.g["R_csv_app"] = "tmux new-window sc-im"
vim.g["R_csv_app"] = "kitten @ --to unix:/tmp/kitty_sock launch --type tab sc-im"
vim.g["R_cmd"] = "R"
vim.g["R_OutDec"] = ","
vim.g["R_silent_term"] = 1
vim.g["R_assign_map"] = "<M-->"
vim.g["R_rconsole_width"] = 50
vim.g["R_min_editor_width"] = 18
vim.g["vim.g.R_openpdf"] = 1
vim.g["vim.g.R_clear_console"] = 0
vim.g["R_hl_term"] = 0
vim.g["R_openhtml"] = 1
vim.g["zotcite_open_in_zotero"] = 1
vim.g["R_app"] = "radian"
-- vim.g["R_external_term"] = "kitty -1 --class rterm -T rterm -o initial_window_width=65c -o initial_window_height=17c -e"
vim.g["R_bracketed_paste"] = 1
vim.g["R_clsoe_term"] = 1
vim.g["R_hi_fun"] = 0
vim.g["rmd_syn_hl_chunck"] = 1
vim.g["rout_follow_colorscheme"] = 1
vim.g["zotcite_filetypes"] = { "markdown", "pandoc", "rmd", "norg" }
vim.opt.spelllang = "en_us,tr"
vim.g["R_args"] = { "--no-save", "--quiet", "--no-restore", "--no-site-file" }
vim.wo.linebreak = true
