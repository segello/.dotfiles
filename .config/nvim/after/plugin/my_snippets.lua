local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local d = ls.dynamic_node
local sn = ls.snippet_node

local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("php", {
	s(
		"phpdoc",
		fmt(
			[[
        /**
         * {}
         */
        ]],
			{
				i(0),
			}
		)
	),
})

ls.add_snippets("php", {
	s(
		"assoc_array",
		fmt(
			[[
		[
			{} => {},
            {}
		]
		]],
			{
				i(1, "key"),
				i(2, "value"),
                d(3, nil, {}),
			}
		)
	),
})

