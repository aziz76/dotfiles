require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- TmuxNavigator

map({ "n" }, "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "Navigate Left" })
map({ "n" }, "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "Navigate Down" })
map({ "n" }, "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "Navigate Up" })
map({ "n" }, "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "Navigate Right" })
map({ "n" }, "<C-f>", "<cmd> Format<CR>", { desc = "Apply code formatting" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
