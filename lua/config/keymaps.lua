local builtin = require("telescope.builtin")
local cmp = require("cmp")

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
})

return {
	vim.keymap.set("n", "<C-b>", ":Neotree filesystem toggle right<CR>", {}),
	vim.keymap.set("n", "K", vim.lsp.buf.hover, {}),
	vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions, { desc = "LSP: Get Definition" }),
	vim.keymap.set("n", "<leader>gr", builtin.lsp_references, { desc = "LSP: Get References" }),
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Code Actions" }),
	vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "LSP: Get Format" }),
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP: ReName" }),
	vim.keymap.set("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", {}),
	vim.keymap.set("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", {}),
	vim.keymap.set("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", {}),
	vim.keymap.set("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", {}),
	vim.keymap.set("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", {}),
	vim.keymap.set("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", {}),
	vim.keymap.set("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", {}),
	vim.keymap.set("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", {}),
	vim.keymap.set("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", {}),
	vim.keymap.set("n", "<leader>$", ":BufferLineGoToBuffer -1<CR>", {}),
	vim.keymap.set("n", "<C-f>", builtin.find_files, {}),
}
