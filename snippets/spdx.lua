local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node

-- source: https://spdx.dev/learn/handling-license-info/
-- source: https://spdx.org/licenses/

ls.add_snippets("all", {
	s(
    {
        trig="spdx",
        decr="adding SPDX license header",
    },
    {
		t("SPDX-License-Identifier: "),
        i("license-id"),
	}),
})
