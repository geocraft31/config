return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"theHamsta/nvim-dap-virtual-text",
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"williamboman/mason.nvim",
	},
	config = function()
		local dap = require("dap")

		dap.defaults.fallback.force_external_terminal = false
		dap.defaults.fallback.terminal_win_cmd = "tab new"

		dap.adapters.gdb = {
			type = "executable",
			command = "C:\\msys64\\mingw64\\bin\\gdb.exe", -- Update this path if needed
			args = { "--interpreter=dap", "--tty=/dev/tty" },
			-- args = { "-i=mi" },
		}

		dap.configurations.cpp = {
			{
				name = "Launch",
				type = "gdb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "\\", "file")
				end,
				cwd = vim.fn.getcwd(), -- Ensures the working directory is correct
				stopOnEntry = false,
				args = {},
				externalConsole = false,
				runInTerminal = true,
			},
		}
	end,
}
