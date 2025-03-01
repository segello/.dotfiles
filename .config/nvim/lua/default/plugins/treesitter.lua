return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"php",
				"html",
				"typescript",
				"javascript",
				"rust",
				"python",
			},
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
			modules = {},
			sync_install = false,
			ignore_install = {},
		})
	end,
}
