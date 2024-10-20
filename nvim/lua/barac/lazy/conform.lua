return {
	'stevearc/conform.nvim',
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				php = { "php-cs-fixer" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
			formatters = {
				["php-cs-fixer"] = {
					command = "php-cs-fixer",
					args = {
						"fix",
						"--rules=@PSR12", -- Formatting preset. Other presets are available, see the php-cs-fixer docs.
						"$FILENAME",
					},
					stdin = false,
				},
			},
			notify_on_error = true,
		})
	end
}
