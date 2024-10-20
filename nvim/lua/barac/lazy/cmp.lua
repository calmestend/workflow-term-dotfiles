return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"onsails/lspkind.nvim",
		"L3MON4D3/LuaSnip",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
	},
	config = function()
		--Ensuring Nvim-CMP Is Working
		local nvim_cmp_status, nvim_cmp = pcall(require, "cmp")
		if not nvim_cmp_status then
			print("Nvim-CMP Is Not Working")
			return
		end
		--Ensuring LspKind Is Working
		local lspkind_status, lspkind = pcall(require, "lspkind")
		if not lspkind_status then
			print("CMP-Kind Is Not Working")
			return
		end

		--LspKind Setup
		lspkind.init({
			mode = "symbol_text",
			preset = "codicons",
			symbol_map = {},
		})

		--Nvim-CMP Setup
		vim.opt.completeopt = "menu,menuone,noselect"
		nvim_cmp.setup({
			completion = {
				autocomplete = false,
			},
			window = {
				completion = nvim_cmp.config.window.bordered(),
				documentation = nvim_cmp.config.window.bordered(),
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = nvim_cmp.mapping.preset.insert({
				["<C-n>"] = nvim_cmp.mapping.select_next_item(), -- Next Suggestion
				["<C-p>"] = nvim_cmp.mapping.select_prev_item(), -- Previous Suggestion
				["<C-Space>"] = nvim_cmp.mapping.complete(), -- Show Completion Suggestions
				["<C-e>"] = nvim_cmp.mapping.abort(), -- Close Completion Window
				["<CR>"] = nvim_cmp.mapping.confirm({
					select = true,
				}),
			}),
			sources = nvim_cmp.config.sources({
				{ name = "nvim_lsp" }, -- LSP Source
				{ name = "luasnip" }, -- Lua Snippet Engine
				{ name = "buffer" }, -- Current Buffer Source
				{ name = "path" }, -- Path Source
				{ name = "vim-dadbod-completion" }, -- Vim dadbod source
			}),
			formatting = {
				format = lspkind.cmp_format({
					wirth_text = false,
					maxWidth = 50,
				}),
			},
		})
	end,
}
