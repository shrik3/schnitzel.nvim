local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node

local function stdout_or_paceholder(cmd, placeholder, text)
	local handle = io.popen(cmd)
	local result = handle:read("*a")
	handle:close()
	result = result:gsub("[\n\r]", "")
	if result == nil or result == "" then
		return i(placeholder, text)
	else
		return t(result)
	end
end

local function git_get_author()
	return sn(nil, {
		stdout_or_paceholder("git config --get user.name", 1, "Name"),
		t(" <"),
		stdout_or_paceholder("git config --get user.email", 2, "Email"),
		t(">"),
	})
end

return {

	s("Signed-off-by", {
		t("Signed-off-by: "),
		d(1, git_get_author),
	}),

	s("Tested-by", {
		t("Tested-by: "),
		d(1, git_get_author),
	}),

	s("Reviewed-by", {
		t("Reviewed-by: "),
		d(1, git_get_author),
	}),

	s("Acked-by", {
		t("Acked-by: "),
		d(1, git_get_author),
	}),

	s("Co-authored-by", {
		t("Co-authored-by: "),
		i(1, "name"),
		t(" <"),
		i(2, "email"),
		t(">"),
	}),

	s("Suggested-by", {
		t("Suggested-by: "),
		i(1, "name"),
		t(" <"),
		i(2, "email"),
		t(">"),
	}),

	s("Requested-by", {
		t("Requested-by: "),
		i(1, "name"),
		t(" <"),
		i(2, "email"),
		t(">"),
	}),

	s("Reported-by", {
		t("Reported-by: "),
		i(1, "name"),
		t(" <"),
		i(2, "email"),
		t(">"),
	}),

	s("Cc", {
		t("Cc: "),
		i(1, "name"),
		t(" <"),
		i(2, "email"),
		t(">"),
	}),

	s("Closes: ", {
		t("Closes: "),
		i(1, "URL"),
	}),

	s("Fixes: ", {
		t("Fixes: "),
		i(1, "URL-OR-HASH"),
	}),

	s("Implements: ", {
		t("Implements: "),
		i(1, "URL"),
	}),

	s("References: ", {
		t("References: "),
		i(1, "URLs"),
	}),

	s("Changelog-added: ", {
		t("Changelog-added"),
		i(1, "DESC"),
	}),

	s("Changelog-fixed: ", {
		t("Changelog-added"),
		i(1, "DESC"),
	}),

	s("Changelog-changed: ", {
		t("Changelog-added"),
		i(1, "DESC"),
	}),

	s("Changelog-deprecated: ", {
		t("Changelog-added"),
		i(1, "DESC"),
	}),
}
