return {
	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
		priority = 1000, -- make sure to load this before all the other start plugins
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "frappe",
				transparent_background = true,
				custom_highlights = function(colors)
					return {
						-- LineNr = { fg = colors.overlay2 }, -- Use a brighter overlay color
						Comment = { fg = colors.overlay1 }, -- Slightly darker for comments
						NormalFloat = { bg = colors.mantle },
						Pmenu = { bg = colors.mantle, fg = colors.text }, -- Completion menu background
						-- PmenuSel = { bg = colors.blue, fg = colors.crust }, -- Selected menu item
						ColorColumn = { bg = colors.mantle },
					}
				end,
			})
		end,
	},
	{
		"askfiy/visual_studio_code",
		priority = 100,
		config = function()
			require("visual_studio_code").setup({
				-- `dark` or `light`
				mode = "dark",
				-- Whether to load all color schemes
				preset = true,
				-- Whether to enable background transparency
				-- transparent = true,
				-- Whether to apply the adapted plugin
				expands = {
					hop = true,
					dbui = true,
					lazy = true,
					aerial = true,
					null_ls = true,
					nvim_cmp = true,
					gitsigns = true,
					which_key = true,
					nvim_tree = true,
					lspconfig = true,
					telescope = true,
					bufferline = true,
					nvim_navic = true,
					nvim_notify = true,
					vim_illuminate = true,
					nvim_treesitter = true,
					nvim_ts_rainbow = true,
					nvim_scrollview = true,
					nvim_ts_rainbow2 = true,
					indent_blankline = true,
					vim_visual_multi = true,
				},
				hooks = {
					before = function(conf, colors, utils) end,
					after = function(conf, colors, utils) end,
				},
			})
		end,
	},
}
