return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- setup lualine
		require("lualine").setup({
			options = {
				theme = "auto",
				globalstatus = true,
			},
			tabline = {
				lualine_b = {
					{
						"buffers",
						symbols = {
							modified = " ●", -- Indicator for modified buffers
							alternate_file = " ", -- Symbol for alternate file (disable if unnecessary)
						},
					},
				},
			},
			sections = {
				lualine_x = { "encoding", "fileformat", "filetype" },
			},
		})

		vim.o.cmdheight = 0 -- Default: Hide the command line

		-- Automatically set cmdheight to 1 in command mode
		vim.api.nvim_create_autocmd("CmdlineEnter", {
			pattern = "*",
			callback = function()
				vim.o.cmdheight = 1 -- Show command line when entering command mode
			end,
		})

		-- Restore cmdheight to 0 after leaving command mode
		vim.api.nvim_create_autocmd("CmdlineLeave", {
			pattern = "*",
			callback = function()
				vim.o.cmdheight = 0 -- Hide command line again
			end,
		})
	end,
}
