return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"rcarriga/nvim-dap-ui",
	},
	config = function()
		local dap = require("dap")

		local dapui = require("dapui")

		-- setup --
		dapui.setup()

		dap.defaults.focus_terminal = true

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			print("event_terminated fired")
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		-- Define the highlight group for the current debug line
		-- NOTE: deprecated way to get highlight
		vim.api.nvim_set_hl(0, "DapStoppedLine", { bg = "#3c3836", fg = "#fabd2f" })
		vim.api.nvim_set_hl(0, "DapStoppedLineSign", {
			bg = "#3c3836",
			fg = vim.api.nvim_get_hl_by_name("DiagnosticHint", true).foreground,
		})

		-- Define custom glyphs for breakpoints
		vim.fn.sign_define("DapBreakpoint", { text = "󰯉 ", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
		vim.fn.sign_define(
			"DapBreakpointCondition",
			{ text = "◆", texthl = "DiagnosticWarn", linehl = "", numhl = "" }
		)
		vim.fn.sign_define("DapLogPoint", { text = "◉", texthl = "DiagnosticInfo", linehl = "", numhl = "" })
		vim.fn.sign_define(
			"DapStopped",
			{ text = "→", texthl = "DapStoppedLineSign", linehl = "DapStoppedLine", numhl = "DapStoppedLine" }
		)

		-- php --
		dap.adapters.php = {
			type = "executable",
			command = "node",
			args = { "/Users/oliversegell/tools/debuggers/vscode-php-debug/out/phpDebug.js" },
		}

		-- dap.configurations.php = {
		-- 	{
		-- 		name = "Listen for Xdebug",
		-- 		type = "php",
		-- 		request = "launch",
		-- 		port = 9002,
		-- 		pathMappings = {
		-- 			["/var/www/html"] = "${workspaceFolder}", -- Map server path to local workspace
		-- 		},
		-- 	},
		-- }

		vim.keymap.set("n", "<Leader>dt", function()
			dap.toggle_breakpoint()
		end, { desc = "Toggle debug breakpoint" })

		vim.keymap.set("n", "<Leader>dc", function()
			dap.continue()
		end, { desc = "Debug continue/start" })

		vim.keymap.set("n", "<Leader>ds", function()
			dap.step_over()
		end, { desc = "Debug step over" })

		vim.keymap.set("n", "<Leader>di", function()
			dap.step_into()
			dap.focus_frame()
		end, { desc = "Debug step in" })

		vim.keymap.set("n", "<Leader>do", function()
			dap.step_out()
			dap.focus_frame()
		end, { desc = "Debug step out" })

		vim.keymap.set("n", "<Leader>de", function()
			dapui.eval()
		end, { desc = "DAP UI evaluate current selection or word" })

		vim.keymap.set("n", "<Leader>dq", function()
			dap.terminate()
			dapui.close()
		end, { desc = "Terminate debug session and close debug windows" })

		vim.keymap.set("n", "<Leader>db", function()
			dap.clear_breakpoints()
		end, { desc = "Clear all breakpoints" })
	end,
}
