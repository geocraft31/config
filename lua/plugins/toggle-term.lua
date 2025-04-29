return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<C-t>]],
			direction = "float",
			shade_terminals = true,
			border = "curved",
			title_pos = "center",
			shell = "powershell",
		})
	end,
}
