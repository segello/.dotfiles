return {
	"rcarriga/nvim-notify",
	config = function()
		vim.notify = require("notify") -- Use notify for popups
		require("notify").setup({
			stages = "slide",
			render = "compact",
			fps = 60,
			timeout = 3000, -- Duration (ms)
			background_colour = "#000000",
			merge_duplicates = true,
		})
	end,
}
