-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set

map("n", "<LocalLeader>g", "<cmd>RSend httpgd::hgd(); httpgd::hgd_browse()<CR>", { desc = "Start httpgd" })
-- map("n", "<localleader>l", "<Plug>(neoterm-repl-send-line)", { desc = "send to line to repl" })
-- map("n", "<localleader>pn", "<Plug>(neoterm-repl-send)", { desc = "send to repl" })
-- map("x", "<localleader>pv", "<Plug>(neoterm-repl-send)", { desc = "send to repl visual" })
