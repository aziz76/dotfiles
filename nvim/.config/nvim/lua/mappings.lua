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

-- Nvim DAP
map({ "n" }, "<Leader>dl", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
map({ "n" }, "<Leader>dj", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
map({ "n" }, "<Leader>dk", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
map({ "n" }, "<Leader>dc", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debugger continue" })
map({ "n" }, "<C-A-r>", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debugger continue" })
map({ "n" }, "<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Debugger toggle breakpoint" })
map(
  { "n" },
  "<Leader>dd",
  "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
  { desc = "Debugger set conditional breakpoint" }
)
map({ "n" }, "<Leader>de", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Debugger reset" })
map({ "n" }, "<Leader>dr", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debugger run last" })
map({ "n" }, "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Debugger testables" })

map({ "n" }, "K", "<cmd>lua vim.cmd('RustLsp codeAction')<CR>", { desc = "rustaceanvim's codeActions" })
map({ "n" }, "<Leader>a", "<cmd>lua vim.cmd('RustLsp hover actions')<CR>", { desc = "rustaceanvim's hover actions" })
-- Rust tools
-- map({ "n" }, "<C-Space>", "<cmd>")
