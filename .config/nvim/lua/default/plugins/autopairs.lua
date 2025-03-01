return {
	"windwp/nvim-autopairs",
	event = { "InsertEnter" },
	dependencies = {
		"hrsh7th/nvim-cmp",
	},
	config = function()
		-- import nvim-autopairs
		local autopairs = require("nvim-autopairs")

		-- configure autopairs
		autopairs.setup({
			check_ts = true, -- enable treesitter
			ts_config = {
				lua = { "string" }, -- don't add pairs in lua string treesitter nodes
				javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
				java = false, -- don't check treesitter on java
			},
		})

		local Rule = require("nvim-autopairs.rule")
		local cond = require("nvim-autopairs.conds")

		-- import nvim-autopairs completion functionality
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")

		-- import nvim-cmp plugin (completions plugin)
		local cmp = require("cmp")

		-- make autopairs and completion work together
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

		autopairs.add_rule(Rule("<", ">", {
			-- if you use nvim-ts-autotag, you may want to exclude these filetypes from this rule
			-- so that it doesn't conflict with nvim-ts-autotag
			"-html",
			"-javascriptreact",
			"-typescriptreact",
		}):with_pair(
			-- regex will make it so that it will auto-pair on
			-- `a<` but not `a <`
			-- The `:?:?` part makes it also
			-- work on Rust generics like `some_func::<T>()`
			cond.before_regex("%a+:?:?$", 3)
		):with_move(function(opts)
			return opts.char == ">"
		end))

		autopairs.add_rule(Rule("|", "|", { "rust" }):with_pair():with_move(function(opts)
			return opts.char == "|"
		end))
	end,
}
