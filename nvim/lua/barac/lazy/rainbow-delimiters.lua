return {
	"HiPhish/rainbow-delimiters.nvim",
	name = "rainbow-delimiters",
	config = function()
		local rainbow_delimiters = require("rainbow-delimiters")

		---@type rainbow_delimiters.config
		vim.g.rainbow_delimiters = {
			strategy = {
				[""] = rainbow_delimiters.strategy["global"],
				vim = rainbow_delimiters.strategy["local"],
			},
			query = {
				[""] = "rainbow-delimiters",
				lua = "rainbow-blocks",
			},
			priority = {
				[""] = 110,
				lua = 210,
			},
			highlight = {
				"#dd9999",
				"#5f8787",
				"#333333",
				"#a06666",
			},
		}
	end,
}
