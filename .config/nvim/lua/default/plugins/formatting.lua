return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				liquid = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				php = { "php-cs-fixer" },
			},
			-- format_on_save = {
			-- 	lsp_fallback = true,
			-- 	async = false,
			-- 	timeout_ms = 1000,
			-- },
			formatters = {
				["php-cs-fixer"] = {
					command = "php-cs-fixer",
					args = {
						"fix",
						"--rules=@PSR12", -- Formatting preset. Other presets are available, see the php-cs-fixer docs.
						"$FILENAME",
					},
					stdin = false,
				},
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })

		local function show_notification(message, level)
			vim.notify(message, level, { title = "conform.nvim" })
		end

		vim.api.nvim_create_user_command("FormatToggle", function(args)
			local is_global = not args.bang
			if is_global then
				vim.g.disable_autoformat = not vim.g.disable_autoformat
				if vim.g.disable_autoformat then
					show_notification("Autoformat-on-save disabled globally", "info")
				else
					show_notification("Autoformat-on-save enabled globally", "info")
				end
			else
				vim.b.disable_autoformat = not vim.b.disable_autoformat
				if vim.b.disable_autoformat then
					show_notification("Autoformat-on-save disabled for this buffer", "info")
				else
					show_notification("Autoformat-on-save enabled for this buffer", "info")
				end
			end
		end, {
			desc = "Toggle autoformat-on-save",
			bang = true,
		})
	end,
}
