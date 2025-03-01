return {
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup({
			timeout = 3000,
			background_colour = "#1e1e1e",
		})
	end,
}
