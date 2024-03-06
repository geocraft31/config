return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local cmp = require("cmp")

		local lspconfig = require("lspconfig")

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "pyright" },
				{ name = "texlab" },
				{ name = "tsserver" },
			}, {
				{ name = "buffer" },
			}),
		})

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		lspconfig["pyright"].setup({
			capabilities = capabilities,
		})

		lspconfig["texlab"].setup({
			capabilities = capabilities,
		})

		lspconfig["tsserver"].setup({
			capabilities = capabilities,
		})

		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	end,
}
