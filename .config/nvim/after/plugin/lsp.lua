local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT", -- Neovim uses LuaJIT
			},
			diagnostics = {
				globals = { "vim" }, -- Add 'vim' to globals
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true), -- Include Neovim runtime files
			},
			telemetry = {
				enable = false, -- Disable telemetry for privacy
			},
		},
	},
})

lspconfig.ts_ls.setup({})
