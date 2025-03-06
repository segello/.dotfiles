return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		local cursor_theme_width = 0.98
		local cursor_theme_height = 0.3

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-p>"] = actions.move_selection_previous, -- move to prev result
						["<C-n>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
				prompt_prefix = "  ",
				selection_caret = "> ",
			},
			pickers = {
				find_files = {
					theme = "dropdown",
					previewer = false,
					prompt_prefix = "󰱼  ",
				},
				git_files = {
					theme = "dropdown",
					previewer = false,
					prompt_prefix = "  ",
				},
				buffers = {
					theme = "ivy",
					results_title = false,
					preview_title = false,
					prompt_title = "Buffers",
					sort_lastused = true,
					-- ignore_current_buffer = true,
					initial_mode = "normal",
					mappings = {
						n = {
							["x"] = actions.delete_buffer,
						},
					},
				},
				git_status = {
					theme = "ivy",
					results_title = false,
					preview_title = false,
					prompt_title = " Git Status",
					sort_lastused = true,
					initial_mode = "normal",
				},
				grep_string = {
					theme = "cursor",
					initial_mode = "normal",
					layout_config = {
						width = cursor_theme_width,
						height = cursor_theme_height,
					},
				},
				live_grep = {
					prompt_prefix = "  ",
				},
				lsp_references = {
					theme = "cursor",
					initial_mode = "normal",
					preview_title = false,
					layout_config = {
						width = cursor_theme_width,
						height = cursor_theme_height,
					},
				},
			},
		})

		telescope.load_extension("fzf")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fw", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set("v", "<leader>fw", function()
			vim.cmd('normal! "vy')
			local text = vim.fn.getreg('"') -- get selected text
			require("telescope.builtin").grep_string({ search = text })
		end, { noremap = true, silent = true })
		keymap.set("n", "<leader>fb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Fuzzy find in buffer" })

		keymap.set("n", "<leader>fg", "<cmd>Telescope git_files<cr>", { desc = "Find git files in cwd" })
		keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Display git status for cwd" })
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
		keymap.set("n", "<leader><leader>", "<cmd>Telescope buffers<cr>", { desc = "Telescope buffers" })
		keymap.set(
			"n",
			"<leader>la",
			"<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>",
			{ desc = "Show all symbols in buffer" }
		)
		keymap.set(
			"n",
			"<leader>lf",
			"<cmd>lua require('telescope.builtin').lsp_document_symbols({ symbols = { 'function', 'method' }})<cr>",
			{ desc = "Show all functions/methods in buffer" }
		)
	end,
}
