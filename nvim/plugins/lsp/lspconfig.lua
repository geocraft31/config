return {
	"neovim/nvim-lspconfig",
	dependencies = { "williamboman/mason-lspconfig.nvim" },
	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "clangd" }, -- Ensure clangd is installed
			automatic_installation = true,
		})

		local base = require("cmp")
		local lspconfig = require("lspconfig")
		local on_attach = base.on_attach
		local capabilities = base.capabilities

		require("mason-lspconfig").setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end,
		})

		-- Configure clangd
		lspconfig.clangd.setup({
			cmd = { "clangd", "--log=verbose" }, -- Enable verbose logging
			init_options = {
				clangdFileStatus = true, -- Optional, enables file status support
				fallbackFlags = {
					"-I" .. vim.fn.getcwd() .. "./lib",
					"-I" .. vim.fn.getcwd() .. "./src",
					"-I" .. vim.fn.getcwd() .. "./inc",
				},
			},
			on_attach = function(client, bufnr)
				client.server_capabilities.signatureHelpProvider = false
				if on_attach then
					on_attach(client, bufnr)
				end
			end,
			capabilities = capabilities,
		})
	end,
}
