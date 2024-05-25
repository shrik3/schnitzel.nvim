local rt = require("rust-tools")

rt.setup({
	server = {
		settings = {
			["rust-analyzer"] = {
				inlayHints = {
					auto = false,
					locationLinks = false,
				},
			},
		},
	},
})
