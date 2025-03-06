require("default.remap")
require("default.set")
require("default.floating_windows")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

local opts = {
	ui = {
		border = "rounded", -- Adds a rounded border around the Lazy GUI
	},
}

require("lazy").setup({
	{ import = "default.plugins" },
	{ import = "default.plugins.lsp" },
}, opts)

-- vim.cmd([[
--     augroup DressingWindows
--     autocmd!
--     autocmd ColorScheme * highlight NormalFloat guibg=none
--     autocmd ColorScheme * highlight FloatBorder guibg=none guifg=none
--     augroup END
-- ]])

-- catppuccin, tokyonight, visual_studio_code
vim.cmd.colorscheme("catppuccin")

-- dynamically toggle transparent background if catppuccin theme
vim.keymap.set("n", "<leader>b", function()
	local cat = require("catppuccin")
	cat.options.transparent_background = not cat.options.transparent_background
	cat.compile()
	vim.cmd.colorscheme(vim.g.colors_name)
end)
