return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	config = function()
		local highlight = {
			"RainbowRed",
			"RainbowYellow",
			"RainbowBlue",
			"RainbowOrange",
		}
		local hooks = require("ibl.hooks")
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#dd9999" })
			vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#5f8787" })
			vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#333333" })
			vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#a06666" })
		end)

		vim.g.rainbow_delimiters = { highlight = highlight }
		require("ibl").setup({ scope = { highlight = highlight } })

		hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
	end,
}
