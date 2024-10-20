return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		--Mason Setup
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓ ",
				},
			},
		})

		--Mason-LSP Setup
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"java_language_server"
			},
		})
		require("mason-tool-installer").setup({
			ensure_installed = {
				"prettierd",
				"prettier",
				"eslint_d",
			},
		})
	end,
}
