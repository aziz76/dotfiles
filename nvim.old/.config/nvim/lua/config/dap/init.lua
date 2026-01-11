local dap = require("dap")

-- ui
require("config.dap.ui")

-- debuggers
local gdb = require("config.dap.adaptors.gdb")
local cppdbg = require("config.dap.adaptors.cppdbg")

dap.adapters.gdb = gdb.adapter
dap.adapters.cppdbg = cppdbg.adapter

dap.configurations.c = gdb.config
dap.configurations.cpp = cppdbg.config
dap.configurations.rust = gdb.config
